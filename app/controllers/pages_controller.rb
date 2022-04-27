require "csv"

class PagesController < ApplicationController
    include PagesHelper 
    def index
        @shows = csv_data
    end
end
