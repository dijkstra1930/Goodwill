require 'spec_helper'

describe Product do

  let(:user) { FactoryGirl.create(:user) }
  before { @product = user.products.build(product_name: "Test product",
                                          product_price: 13.00, product_description: "Lorem ipsum")}

  subject { @product }

  it { should respond_to(:product_name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @product.user_id = nil }
    it { should_not be_valid }
  end
  end