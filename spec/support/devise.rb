# frozen_string_literal: true

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers
  # config.include Devise::Test::ViewHelpers

  # def resource_name
  #   :user
  # end

  def resource
    @resource ||= User.new
  end

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
end