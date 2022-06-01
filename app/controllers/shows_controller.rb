# frozen_string_literal: true

class ShowsController < ApplicationController
    def index
        @shows = limit(Show.order('id ASC')).sort_by{ |a| a.starred?(current_user) ? 0 : 1 }
    end

    def update
        find_show
        
        if @show.voted_up_by? current_user
            @show.disliked_by current_user
        else
            @show.liked_by current_user
        end

        respond_to do |f|
            f.json
        end
    end

    private

    def limit(array)
        array.take(params[:limit]&.to_i || 10)
    end

    def find_show
        @show = Show.find(params[:id])
    end
end
