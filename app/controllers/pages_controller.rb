require "csv"

class PagesController < ApplicationController
    def index
        @shows = Show.take(params[:limit]&.to_i || 10)
    end
end
