# frozen_string_literal: true

class RemoveStarredFromShows < ActiveRecord::Migration[7.0]
  def change
    remove_column :shows, :starred, :boolean
  end
end
