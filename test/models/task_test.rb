require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test "should not save task without name" do
    task = Task.create(name: nil)
    assert_not task.save, "saved task without name"
  end

  test "should not save task with name longer than 50 characters" do
    task = Task.create(name: "a"*101)
    assert_not task.save, "saved tasks with names longer than 100 characters"
  end

  test "should not save a task with notes longer than 300 characters" do
    task = Task.create(name: "Test Task", description: "a"*301)
    assert_not task.save, "saved tasks with description longer than 300 characters"
  end
end
