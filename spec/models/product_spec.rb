require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'is valid with valid attributes' do
      category = Category.new(name: "Some New Category")
      product = described_class.new(name: "Beenie", price_cents: 12, quantity: 15, category: category)
      expect(product).to be_valid
      #expect(product.errors.full_messages).to be_empty
    end
   
    #Validates if the product has a name
    it 'is invalid without a name' do
      category = Category.new(name: "New Category")
      product = described_class.new(name: nil, price_cents: 13, quantity: 12, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without a price' do
      category = Category.new(name: "Some Category")
      product = described_class.new(name: "Big Tools", price_cents: nil, quantity: 12, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'is invalid without a quantity' do
      category = Category.new(name: "Which category")
      product = described_class.new(name: "Chemise", price_cents: 30, quantity: nil, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is invalid without a category' do
      category = Category.new(name: "Hammers")
      product = described_class.new(name: "Jack-Hammer", price_cents: 150, quantity: 40, category: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
