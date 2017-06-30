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

  it "shows a specific product" do
    visit products_path
    click_link 'someproduct'
    expect(page).to have_content 'someproduct'
  end

  it "adds a review to a specific product" do
    visit products_path
    click_link 'someproduct'
    click_link 'Add a review'
    fill_in 'Author', :with => 'someone'
    fill_in 'Content', :with => 'This is some content'
    choose 'review_rating_2'
    click_on 'Create Review'
    expect(page).to have_content 'someone'
    expect(page).to have_content 'This is some content'
  end
end
