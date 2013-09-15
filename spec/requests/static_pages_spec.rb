require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "About Page" do
    it "should have the content 'About'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/About'
      expect(page).to have_content('About')
    end
  end
end
