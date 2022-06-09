# frozen_string_literal: true

require_relative "application_record"

class Show < ApplicationRecord
    validates :show_type, :title, :release_year, presence: true

    acts_as_votable
    has_many :votes, foreign_key: :votable_id

    enum show_type: {
        'Movie': 0,
        'TV Show': 1
    }

    def self.order_starred_by_user(id)
        by_user = sanitize_sql_array([ 'case when votes.voter_id = %d then 0 else 1 end', id])
        order(Arel.sql(by_user))
    end

    def starred?(user)
        user.voted_for? self
    end
end
