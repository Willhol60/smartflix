require_relative "../models/show.rb"

class StarredShowsController < ApplicationController
  before_action :find_show

  def create
    starred_show = StarredShow.new()

    starred_show.user = current_user
    starred_show.show = @show

    starred_show.save!

    respond_to do |f|
      f.json { render json: @show }
    end
  end

  def destroy
    starred_show = StarredShow.find_by!(
      user_id: current_user.id, 
      show_id: params[:show_id] 
    )

    starred_show.destroy!

    respond_to do |f|
      f.json { render json: @show }
    end
  end

  private

  def find_show
    @show = Show.find(params[:show_id])
  end
end
