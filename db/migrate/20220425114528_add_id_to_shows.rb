class AddIdToShows < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :show_id, :integer
  end
end
