class AddStarredColumnToShows < ActiveRecord::Migration[7.0]
  def change
    add_column(:shows, :starred, :boolean, default: false, null: false)
  end
end
