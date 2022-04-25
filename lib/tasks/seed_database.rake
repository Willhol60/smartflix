require "csv"
require_relative "../../app/models/show.rb"

desc "Seed the postgres database with the CSV file"

task seed: :environment do 
    puts "seeding"

    def create_hash
        data = []
        CSV.foreach("lib/assets/netflix_titles.csv", headers: true) do |row|
            data << row.to_h
        end
        data
    end

    def change_show_type_column(hash)
        hash.each { |k| k["show_type"] = k.delete "type" }
    end

    shows = change_show_type_column(create_hash)
    Show.import(shows)
    puts "done"
end