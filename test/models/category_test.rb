require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
    test "creates a valid category" do
        category = Category.new
        category.name = "Lunch"
        assert category.save
    end
    
    test "verifies has_many relationship" do
        #should_have_many :recipes
    end
end
