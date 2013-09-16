require 'spec_helper'

describe User do

  before do
    @user = User.new(username: "Example User", email: "user@example.com",
                     password: "foobar")
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }

  it { should respond_to(:authenticate) }


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

  describe "return value of authenticate method" do
    before {
      @user.save
      let(:found_user) { User.find_by_email(@user.email) }
    }
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end