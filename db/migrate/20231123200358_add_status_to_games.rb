class AddStatusToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :status, :string
  end
end
