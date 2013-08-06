require 'spec_helper'

describe User do
  before do 
    @user = User.new(
      name: "user",
      email: "example@example.com",
      password: "password"
    )
  end

  subject { @user }


  it { should respond_to :name }
  it { should be_valid }

  # it 'responds to name' do 
  #  @user.name = ""
  #   expect
  # end
end
