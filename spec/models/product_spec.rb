require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'is valid with valid attributes' do
      category = Category.new(name: "Some New Category")
      product = described_class.new(name: "Beenie", price: 12, quantity: 15, category: category)
      expect(product).to be_valid
      #expect(product.errors.full_messages).to be_empty
    end
   
    #Validates if the product has a name
    it 'is invalid without a name' do
      category = Category.new(name: "New Category")
      product = described_class.new(name: nil, price: 13, quantity: 12, category: category)
      expect(product.name).to be_nil
      expect(product.errors.full_messages).to be_empty
    end

    it 'is invalid without a price' do
      category = Category.new(name: "Some Category")
      product = described_class.new(name: "Big Tools", price: nil, quantity: 12, category: category)
      expect(product.price).to be_nil
      expect(product.errors.full_messages).to be_empty
    end
    it 'is invalid without a quantity' do
      category = Category.new(name: "Which category")
      product = described_class.new(name: "Chemise", price: 30, quantity: nil, category: category)
      expect(product.quantity).to be_nil
      expect(product.errors.full_messages).to be_empty
    end
    it 'is invalid without a category' do
    end
  end
end
