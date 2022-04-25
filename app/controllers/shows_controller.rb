require "csv"

class ShowsController < ApplicationController
    def index
        @shows = Show.limit(50)
    end
end
