require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test "should not save Category without title" do
    @category = @user.categories.create(name: nil)
    assert_not @category.save, "saved category without title"
  end
  
  test "should not save Category with name longer than 20 characters" do
    @category = @user.categories.create(name: "a"*21)
    assert_not @category.save, "saved category with title longer than 20 characters"
  end
end
