# frozen_string_literal: true

require "rails_helper"
require "support/devise"

RSpec.describe "devise/sessions/new", :type => :view do
  # visit the page and log in
  # be redirected to root_page
  # try and visit the page again and not be able to
  
  # let(:resource) { create(:user) }

  it "logs the user in if the user isn't already logged in" do

    render
    
    sign_in resource

    expect rendered.to have_text('Smartflix')
  end
end

  