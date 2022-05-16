# frozen_string_literal: true

class StarsController < ApplicationController
    before_action :load_post
  
    def update
      @show.star!

      redirect_to root_path
    end
  
    def destroy
      @show.unstar!

      redirect_to root_path
    end
  
    private
  
    def load_post
      @show = Show.find(params[:show_id])
    end
  end