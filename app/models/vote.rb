# frozen_string_literal: true

require_relative "application_record"

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :show
end
