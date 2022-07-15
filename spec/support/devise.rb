# frozen_string_literal: true

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers
  # this one allows env to be called
  # config.include Devise::Test::ControllerHelpers
  # this one allows user to be called - includes Warden
  # config.include Devise::Test::ControllerHelpers, type: :controller

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
