require "test_helper"
require_relative "../../app/models/show"

class ShowTest < ActiveSupport::TestCase
  test "new Show objects must conform to not-null constraints - valid example" do
    show = Show.new({show_type: 0, title:'x', release_year:2000})
    
    assert show.save
  end
  
  test "without type" do
    show_fail = Show.new({title:'x', release_year:2000})

    assert_not show_fail.save
  end

  test "without title" do
    show_fail = Show.new({show_type:0, release_year:2000})

    assert_not show_fail.save
  end

  test "without release year" do
    show_fail = Show.new({show_type:0, title:'x'})

    assert_not show_fail.save
  end
end