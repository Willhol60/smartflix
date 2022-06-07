# frozen_string_literal: true

require 'rails_helper'
require_relative "../../app/models/show"
require_relative "../../app/models/user"

RSpec.describe User, type: :model do
  it "should act_as_voter according to the acts_as_votable gem" do
    show = Show.take
    user = User.create!(email: 'test@test.com', password: 'secret')
    show.liked_by user

    begin
      expect { user.votes }.not_to raise_error
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).not_to include 'NoMethodError'
    end
  end
end
