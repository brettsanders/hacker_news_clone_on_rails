class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :post_id
      t.integer :vote
      t.timestamps
    end
  end
end
