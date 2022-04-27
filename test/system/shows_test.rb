require "application_system_test_case"

class ShowsTest < ApplicationSystemTestCase
  test "the index page displays 10 shows by default" do
    visit root_path
  
    assert_text "The Starling"
    assert_no_text "Vendetta: Truth, Lies and The Mafia"
  end

  test "the index page can be shortened using the limit parameter" do
    visit "/?limit=4"
  
    assert_text "Jailbirds New Orleans"
    assert_no_text "Kota Factory"
  end
end
