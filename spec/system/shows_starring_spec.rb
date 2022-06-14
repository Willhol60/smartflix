# frozen_string_literal: true

require "rails_helper"

RSpec.describe "The star button on a show's card", type: :system, :js => true do
  # fixtures :shows

  before :each do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
  end

  context "when clicked will create a vote for the show from the current user" do
    it "will make the show's star button say 'starred'" do
      visit "/"
      expect(page).to have_no_text('Starred')
  
      first('.star-button').click
      expect(page).to have_text('Starred')
    end

    it "will (when refreshed) move the starred show to the top of the list" do
      visit "/"

      within all('.star-button')[9].click
      expect{ visit "/" }.to change{ first('.card-title') }
    end

    it "will (when refreshed) move the starred show to the top of the list, regardless of limit set" do
      visit "/"

      within all('.star-button')[9].click
      expect{ visit "/?limit=5" }.to change{ first('.card-title') }
    end
  end
end

  