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

  # user attribute accessors
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password }

  # test bcrypt methods
  it { should respond_to :authenticate }
  it { should respond_to :password_hash }
  it { should respond_to :password=}

  it { should be_valid }

  # test user validations

  # presence 
  describe 'when first name is not present' do 
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe 'when password is not present' do 
    before do 
      @user = User.new(
        name: "Example",
        email: "user@example.com",
        password: ""
      )
    end
    it { should_not be_valid }
  end

  
end
