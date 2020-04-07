require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They see product description when clicking on product" do
    #Path
    visit root_path
   
    page.find('.product', match: :first).find('a', text: 'Details').click
    page.find('.products-show')
    #Debug
    #save_screenshot
    #Verify
    expect(page).to have_css '.products-show'
  end
end
