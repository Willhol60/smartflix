# frozen_string_literal: true

require "rails_helper"
require "support/devise"
require "pry"

RSpec.describe "Shows", type: :request do
  before :each do
    @user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    sign_in(@user, :scope => :user)
  end

  describe "GET index" do
    it "returns a 200" do
      get shows_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "update" do
    it "which toggles 'voted_for?' from false to true" do
      show = Show.create!(:show_type => 0, :title => "x", :release_year => 2000)

      # binding.pry
      expect{ show.liked_by @user }.to change{ @user.voted_for? show }.from(false).to(true)
    end
    
    it "which toggles 'voted_for?' from true to false" do
      show = Show.create!(:show_type => 0, :title => "x", :release_year => 2000)
      show.liked_by @user
      
      expect{ show.unliked_by @user }.to change{ @user.voted_for? show }.from(true).to(false)
    end
  end
end