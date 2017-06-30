require 'rails_helper'

describe "show page" do
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

  it "Edits a product" do
    visit products_path
    click_link 'someproduct'
    click_link 'Edit Product'
    fill_in 'Name', :with => 'beans'
    fill_in 'Cost', :with => '4'
    fill_in 'Origin', :with => 'Britain'
    click_on 'Update Product'
    expect(page).to have_content 'beans'
    expect(page).to have_content 'Britain'
    expect(page).to have_content '4'
  end

  it "Edits a review" do
    visit products_path
    click_link 'someproduct'
    click_link 'Edit'
    fill_in 'Author', :with => 'coolio'
    fill_in 'Content', :with => 'This is some content!'
    choose 'review_rating_4'
    click_on 'Update Review'
    expect(page).to have_content 'coolio'
    expect(page).to have_content 'This is some content!'
    expect(page).to have_content '4'
  end

  # it "Deletes a product" do
  #   product = Product.create(name: "to be deleted", cost: 4, origin: "Mexico")
  #   product.reviews.create(author: "someperson", content:"some stuff", rating: 4)
  #   visit products_path
  #   click_link 'to be deleted'
  # # need to deal with js confim here
  #   expect(page).to have_no_content 'to be deleted'
  # end
end
