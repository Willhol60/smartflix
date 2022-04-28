require "test_helper"
require_relative "../../app/models/show"

class ShowTest < ActiveSupport::TestCase
  test "new Show objects must conform to not-null constraints" do
    show_fail1 = Show.new
    show = Show.new({show_type: 'x', title:'x', release_year:2000})

    # assert_response(:error) { show_fail1.save }
    assert show.save
  end
end