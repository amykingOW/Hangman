class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
  validates :name, presence: true

  def self.load_words
    File.readlines("words.txt")
  end
end

