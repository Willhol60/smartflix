# frozen_string_literal: true

class ShowsController < ApplicationController
    before_action :find_show, only: :update

    def index
        @shows = Show.left_outer_joins(:votes)
                     .order("votes.votable_id, id")
                     .limit(params[:limit]&.to_i || 10)
    end

    def update        
        if current_user.voted_for? @show
            @show.unliked_by current_user
        else
            @show.liked_by current_user
        end

        respond_to { |f| f.json }
    end

    private

    def limit(array)
        array.take(params[:limit]&.to_i || 10)
    end

    def find_show
        @show = Show.find(params[:id])
    end
end
