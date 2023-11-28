class RemoveStatusFromGames < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :status, :string
  end
end
