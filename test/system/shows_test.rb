# frozen_string_literal: true

require "application_system_test_case"

class ShowsTest < ApplicationSystemTestCase
  test "the index page displays all information for 10 shows by default" do
    visit root_path
  
    assert_text "show10"
    assert_text "Movie"
    assert 2000
    assert_text "LovelyDescription"
    assert_no_text "show11"
  end

  test "the index page can be shortened using the limit parameter" do
    visit "/?limit=4"
  
    assert_text "show4"
    assert_no_text "show5"
  end

  test "the Show enumerable displays Movie and TV Show depending on the stored integer" do
    visit root_path
    
    assert_text "Movie"
    assert_text "TV Show"
  end
end
