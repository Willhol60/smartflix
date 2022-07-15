# frozen_string_literal: true

class CreateStarredShows < ActiveRecord::Migration[7.0]
  def change
    create_table :starred_shows do |t|
      t.references :user, index: true
      t.references :show, index: true

      t.timestamps
    end
  end
end
