# frozen_string_literal: true

require "rails_helper"

RSpec.describe "The star button on a show's card", type: :system, :js => true do
  fixtures :shows

  before :each do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    sign_in(user, :scope => :user)
  end

  context "when clicked on the card of a show with starred: false" do
    before do
      visit "/"
    end
    
    it "will make the show's star button say 'starred'" do
      expect(page).to have_no_text('Starred')
  
      first('.star-button').click
      expect(page).to have_text('Starred')
    end
  end
end

  