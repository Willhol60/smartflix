# frozen_string_literal: true

require_relative "application_record"

class Show < ApplicationRecord
    validates :show_type, :title, :release_year, presence: true

    enum show_type: {
        'Movie': 0,
        'TV Show': 1
    }
end
