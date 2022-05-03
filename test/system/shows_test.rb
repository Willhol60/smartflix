require "application_system_test_case"

class ShowsTest < ApplicationSystemTestCase
  test "the index page displays 10 shows by default" do
    visit root_path
  
    assert_text "show10"
    assert_no_text "show11"
  end

  test "the index page can be shortened using the limit parameter" do
    visit "/?limit=4"
  
    assert_text "show4"
    assert_no_text "show5"
  end
end
