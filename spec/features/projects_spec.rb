require 'rails_helper'

describe "products page" do
  it "Displays products" do
    visit products_path
    expect(page).to have_content 'someproduct'
  end

  it "Adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'Name', :with => 'beans'
    fill_in 'Cost', :with => '4'
    fill_in 'Origin', :with => 'Britain'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
  end
end
