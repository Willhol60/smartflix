# frozen_string_literal: true

require_relative "application_record"
require "pry"

class StarredShow < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :show, uniqueness: { scope: :user, 
    message: "You've already starred this show" }
end
