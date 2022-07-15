# frozen_string_literal: true

class DropStarredShows < ActiveRecord::Migration[7.0]
  def up
    drop_table :starred_shows
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
