# frozen_string_literal: true

require "rails_helper"
require "pry"

RSpec.describe "The star button on a show's card", :type => :system, :js => true do
  fixtures :shows

  context "when clicked on the card of a show with starred: false" do

    before do
      visit "/"
    end
    
    it "will make the show's star button say 'unstar'" do
      expect(page).to have_no_text('Unstar')
  
      first('.star-button').click
      expect(page).to have_text('Unstar')
    end
    
    it "moves the show to the top of the page" do
      last_card = (all('.card-title').last)[:text]

      all('.star-button').last.click
      
      expect((first('.card-title'))[:text]).to eql(last_card)
    end
  end
end

  