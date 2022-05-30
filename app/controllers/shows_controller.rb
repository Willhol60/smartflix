# frozen_string_literal: true

class ShowsController < ApplicationController
    def index
        # sort by presence in starred_shows, id ASC
        @shows = limit(Show.order('starred DESC', 'id ASC'))
    end

    private

    def limit(array)
        array.take(params[:limit]&.to_i || 10)
    end
end
