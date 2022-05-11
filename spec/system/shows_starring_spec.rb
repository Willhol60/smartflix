# frozen_string_literal: true

require "application_system_test_case"

class ShowsStarringTest < ApplicationSystemTestCase
  test "clicking a star on a show's card will move that show to the top of the page" do
    visit root_path
  
    assert_text "show10"
    assert_text "Movie"
    assert 2000
    assert_text "LovelyDescription"
    assert_no_text "show11"
  end
end
