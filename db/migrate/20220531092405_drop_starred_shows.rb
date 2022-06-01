class DropStarredShows < ActiveRecord::Migration[7.0]
  def up
    drop_table :starred_shows
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
