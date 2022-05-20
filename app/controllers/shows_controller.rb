# frozen_string_literal: true

class ShowsController < ApplicationController
    def index
        @shows = Show.order('starred DESC', 'id ASC').take(params[:limit]&.to_i || 10)
    end

    def update
        show = Show.find(params[:id])
     
        show.toggle_star!

        respond_to do |f|
            f.json { render json: @show }
        end
    end
end
