require "csv"

class PagesController < ApplicationController
    include PagesHelper 
    def index
        @shows = csv_data
        # @shows = []
        # CSV.foreach("lib/assets/netflix_titles.csv", headers: true, header_converters: :symbol) do |row|
        #     @shows << {
        #         title: row[:title],
        #         year: row[:release_year],
        #         type: row[:type],
        #         description: row[:description]
        #     }
        #     break if @shows.length == 10
        # end
    end
end
