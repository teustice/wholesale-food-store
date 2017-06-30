require 'rails_helper'

describe "landing page navigation" do

  it "Displays most the reviewed product" do
    visit root_path
    expect(page).to have_content 'someproduct'
  end

  it "Displays the 3 most recent products" do
    visit root_path
    expect(page).to have_content 'someproduct'
    expect(page).to have_content 'someproduct1'
    expect(page).to have_content 'someproduct2'
  end

  it "navigates to the products page" do
    visit root_path
    click_link 'View Products'
    expect(page).to have_content 'New Product'
  end

  # it "gives error when no name is entered" do
  #   visit new_list_path
  #   click_on 'Create List'
  #   expect(page).to have_content 'errors'
  # end
end
