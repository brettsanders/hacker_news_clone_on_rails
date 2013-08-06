require './gilded_rose.rb'
require "rspec"

describe GildedRose do

  before :each do
    @vest = subject.items[:normal][0]
    @brie = subject.items[:cheese][0]
    @tickets = subject.items[:passes][0]
  end

  it "should do something" do
    subject.update_quality
  end

  it "decrements the sell_in attribute by one" do
    expect{subject.update_quality}.to change{@vest.sell_in}.by(-1)
  end

  it "Doesn't change quality of Sulfuras" do
    sulfuras = subject.items[:legendary][0]
    expect{subject.update_quality}.not_to change{sulfuras.quality}
  end

  it "should decrease quality of standard items by one before sell-in" do
    expect{subject.update_quality}.to change{@vest.quality}.by(-1)
  end

  it "should decrease quality of standard items by two if sell_in reaches 0" do
    @vest.sell_in = 0
    expect{subject.update_quality}.to change{@vest.quality}.by(-2)
  end

  it "should never decrease quality below 0" do
    @vest.quality = 0
    expect{subject.update_quality}.not_to change{@vest.quality}
  end

  it "should increase the quality of aged brie by one" do
    expect{subject.update_quality}.to change{@brie.quality}.by(1)
  end

  it "should not increase quality beyond 50" do
    @brie.quality = 50
    expect{subject.update_quality}.not_to change{@brie.quality}
  end

  it "should increase the quality of concert tickets by 1 when sell_in is above 10" do
    expect{subject.update_quality}.to change{@tickets.quality}.by(1)
  end

  it "should increase the quality of concert tickets by 2 when sell_in is 10 or below" do
    @tickets.sell_in = 10
    expect{subject.update_quality}.to change{@tickets.quality}.by(2)
  end

  it "should increase the quality of concert tickets by 3 when sell_in is 5 or below" do
    @tickets.sell_in = 5
    expect{subject.update_quality}.to change{@tickets.quality}.by(3)
  end

  it "should decrease the quality of concert tickets to 0 after the concert is over" do
    @tickets.sell_in = 0
    expect{subject.update_quality}.to change{@tickets.quality}.to eq(0)
  end

  it "should decrease the quality of conjured items by twice as fast" do
    mana_cake = subject.items[:conjured][0]
    original_vest_qual = @vest.quality
    original_mana_cake_qual = mana_cake.quality
    subject.update_quality
    expect(original_mana_cake_qual - mana_cake.quality).to eql(2 * (original_vest_qual - @vest.quality))
  end

  it "should still decrease conjured items quality by double after sell_in date" do
    mana_cake = subject.items[:conjured][0]
    mana_cake.sell_in = 0
    @vest.sell_in = 0
    original_vest_qual = @vest.quality
    original_mana_cake_qual = mana_cake.quality
    subject.update_quality
    expect(original_mana_cake_qual - mana_cake.quality).to eql(2 * (original_vest_qual - @vest.quality))
  end
end

=begin

Hi and welcome to team Gilded Rose.

As you know, we are a small inn with a prime location in a prominent city ran
by a friendly innkeeper named Allison.  We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as they
approach their sell by date.

We have a system in place that updates our inventory for us. It was developed
by a no-nonsense type named Leeroy, who has moved on to new adventures. Your
task is to add the new feature to our system so that we can begin selling a
new category of items.

First an introduction to our system:

  - All items have a SellIn value which denotes the number of days we have to
    sell the item 

  - All items have a Quality value which denotes how valuable the item is

  - At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

  - Once the sell by date has passed, Quality degrades twice as fast

  - The Quality of an item is never negative

  - "Aged Brie" actually increases in Quality the older it gets

  - The Quality of an item is never more than 50

  - "Sulfuras", being a legendary item, never has to be sold or decreases in
    Quality

  - "Backstage passes", like aged brie, increases in Quality as it's SellIn
    value approaches; Quality increases by 2 when there are 10 days or less
    and by 3 when there are 5 days or less but Quality drops to 0 after the
    concert

We have recently signed a supplier of conjured items. This requires an update
to our system:

  - "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code
as long as everything still works correctly. However, do not alter the Item
class or Items property as those belong to the goblin in the corner who will
insta-rage and one-shot you as he doesn't believe in shared code ownership
(you can make the UpdateQuality method and Items property static if you like,
we'll cover for you).

Just for clarification, an item can never have its Quality increase above 50,
however "Sulfuras" is a legendary item and as such its Quality is 80 and it
never alters.
=end
