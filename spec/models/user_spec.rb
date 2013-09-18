require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }



  describe "when password is not present" do
    before do
      @user = User.new(username: "Example User", email: "user@example.com",
                       password: " ")
    end
    it { should_not be_valid }
  end


  describe "with a password that's too short" do
    before { @user.password  = "a" * 5 }
    it { should be_invalid }
  end

end
