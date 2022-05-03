# frozen_string_literal: true

require "test_helper"
require_relative "../../app/models/show"

class ShowTest < ActiveSupport::TestCase
  test "new Show objects must conform to not-null constraints - valid example" do
    show = Show.new({show_type: 0, title:'x', release_year:2000})
    
    assert show.save
  end
  
  test "without type" do
    show_fail = Show.new({title:'x', release_year:2000})

    assert show_fail.errors[:attribute][0] = "show_type"
    assert show_fail.errors[:type][0] = "blank"
  end

  test "without title" do
    show_fail = Show.new({show_type:0, release_year:2000})

    assert show_fail.errors[:attribute][0] = "title"
    assert show_fail.errors[:type][0] = "blank"
  end

  test "without release year" do
    show_fail = Show.new({show_type:0, title:'x'})

    assert show_fail.errors[:attribute][0] = "release_year"
    assert show_fail.errors[:type][0] = "blank"
  end
end