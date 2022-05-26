# frozen_string_literal: true

require_relative "application_record"

class Show < ApplicationRecord
    has_many :starred_shows, dependent: :destroy
    validates :show_type, :title, :release_year, presence: true

    enum show_type: {
        'Movie': 0,
        'TV Show': 1
    }

    # def toggle_star!
    #     self.starred = !self.starred
    #     self.save!
    # end

    # def starred?
    #     self.starred == true
    # end
end
