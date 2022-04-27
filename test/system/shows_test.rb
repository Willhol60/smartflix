require "application_system_test_case"

class ShowsTest < ApplicationSystemTestCase
  test "the index page displays every show" do
    visit root_path
  
    assert_selector "h1", text: "Smartflix"
    assert_text "Dick Johnson Is Dead"
    assert_text "Blood & Water"
  end
end
