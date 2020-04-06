require 'rails_helper'

RSpec.describe User, type: :model do
 before :each do @user = User.new(first_name: 'Rayesh', last_name: 'Rajah', email: 'ray_6785876@hotmail.com', password: "ChickenPouletYeah", password_confirmation: "ChickenPouletYeah")
 end  

  describe "Validation" do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end
    
    it 'is not valid without a first name' do
     @user.first_name = nil
      expect(@user).to_not be_valid
    end
    
    it 'is not valid without a last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    
    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid when email already exists' do
      @user.save!
      randUser = User.new(first_name: 'Jack', last_name: 'The Ripper', email: 'ray_6785876@hotmail.com', password: "ChickenPouletYeah", password_confirmation: "ChickenPouletYeah")
      expect(randUser).to_not be_valid
    end
    
    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if the password has less than 5 characters' do
      @user.password = "hi"
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a password confirmation " do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
    
    it "is not valid if password_confirmation doesn't match password" do
      @user.password_confirmation = "SomethingElse"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
  end
end
