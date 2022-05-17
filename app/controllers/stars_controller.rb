# frozen_string_literal: true

class StarsController < ApplicationController
    before_action :load_post
  
    def update
      @show.star!

      respond_to do |f|
        f.html { redirect_to root_path }
        f.json { render json: @show }
      end
    end
  
    def destroy
      @show.unstar!

      respond_to do |f|
        f.html { redirect_to root_path }
        f.json { render json: @show }
      end
    end
  
    private
  
    def load_post
      @show = Show.find(params[:show_id])
    end
  end