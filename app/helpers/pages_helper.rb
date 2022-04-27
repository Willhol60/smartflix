require 'csv'

module PagesHelper
    def csv_data
        CSV.foreach("lib/assets/netflix_titles.csv", headers: true, header_converters: :symbol).take(10).map do |row|
            {
                title: row[:title],
                year: row[:release_year],
                type: row[:type],
                description: row[:description]
            }
        end
    end
end
