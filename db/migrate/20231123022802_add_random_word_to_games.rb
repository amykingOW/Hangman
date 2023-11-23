class AddRandomWordToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :random_word, :string
  end
end
