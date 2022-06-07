# frozen_string_literal: true

require 'rails_helper'
require "support/devise"
require_relative "../../app/models/show"
require "pry"

RSpec.describe ShowsHelper, type: :request do
  include ShowsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ERB::Util

  before :each do
    @user = User.create!(:email => 'test@test.com', :password => 'secret')
    login_as(@user, :scope => :user)
  end

  def current_user
    @user
  end
  
  it "returns a 'button_to' element when passed a show not liked by the user" do
    show = Show.take
    current_user
    expect(button_to_toggle_show_starred(show)).to include(
      'form', 
      'class="button_to"', 
      'class="btn btn-outline-warning"'
      )
  end

  it "returns a different 'button_to' element when passed a show liked by the user" do
    show = Show.take
    show.liked_by @user

    expect(button_to_toggle_show_starred(show)).to include(
      'form', 
      'class="button_to"', 
      'class="btn btn-warning"'
      )
  end
end
