# frozen_string_literal: true

require "rails_helper"
require_relative "../../app/models/show"
require_relative "../../app/models/user"

RSpec.describe Show, type: :model do
  context "when creating a new Show" do
    it "objects must conform to not-null constraints - valid example" do
      show = Show.new(:show_type => 0, :title => "x", :release_year => 2000)
  
      expect(show.save).to be_truthy
    end
  
    it "objects cannot be created without show_type attribute" do
      show_fail = Show.new(:title => "x", :release_year => 2000)
  
      expect(show_fail.valid?).to eq(false)
    end
  
    it "objects cannot be created without title attribute" do
      show_fail = Show.new(:show_type => 0, :release_year => 2000)
  
      expect(show_fail.valid?).to eq(false)
    end
  
    it "objects cannot be created without release_year attribute" do
      show_fail = Show.new(:show_type => 0, :title => "x")
      
      expect(show_fail.valid?).to eq(false)
    end
  end

  context "each object can be liked/voted for/starred" do
    it "object can be liked/voted for/starred" do
      show = Show.take
      user = User.create!(email: 'test@test.com', password: 'secret')
      show.liked_by user
  
      expect(user.voted_for?(show)).to eq(true)
    end
  
    it "has a starred? method that returns true if the object it is called on has been liked by the specified user" do
      show = Show.take
      user = User.create!(email: 'test@test.com', password: 'secret')
      show.liked_by user
  
      expect(show.starred?(user)).to eq(true)
    end
  end
end
