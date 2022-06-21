# frozen_string_literal: true

require_relative "application_record"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  acts_as_voter
  has_many :votes, foreign_key: :voter_id

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end
end
