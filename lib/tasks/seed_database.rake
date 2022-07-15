# frozen_string_literal: true

require 'csv'
require_relative '../../app/models/show'

desc 'Seed the postgres database with the CSV file'

task seed: :environment do
  puts 'seeding'
  Show.import(shows_array)
  puts 'done'
end

def shows_array
  data = []
  CSV.foreach('lib/assets/netflix_titles.csv', headers: true) do |row|
    data << row.to_h
  end
  change_show_type_column(data)
end

def change_show_type_column(array)
  array.each { |show| show['show_type'] = show.delete 'type' }
end
