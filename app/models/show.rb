# frozen_string_literal: true

require_relative "application_record"

class Show < ApplicationRecord
    validates :show_type, :title, :release_year, presence: true

    acts_as_votable

    enum show_type: {
        'Movie': 0,
        'TV Show': 1
    }

    def starred?(user)
        user.voted_for? self
    end
end
