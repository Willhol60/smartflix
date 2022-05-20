# frozen_string_literal: true

class ShowsController < ApplicationController
    def index
        @shows = Show.order('starred DESC').take(params[:limit]&.to_i || 10)
    end

    def update
        @show = Show.find(params[:id])
        @show.toggle_star!

        respond_to do |f|
            f.html { redirect_to shows_path }
            f.json { render json: @show }
        end
    end
end
