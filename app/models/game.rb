class Game < ApplicationRecord
  MAX_LIVES = 9
  IN_PROGRESS = "In progress"

  has_many :guesses, dependent: :destroy
  validates :name, presence: true

  def self.load_words
    File.readlines("words.txt")
  end

  # Puts all guessed letters in an array
  def guessed_letters
    guesses.map { |guess| guess.letter }
  end

  # Returns random_word_array with correctly guessed letters and nil
  def build_solved_so_far
    random_word_array.map { |letter| guessed_letters.include?(letter) ? letter : nil }
  end

  # Returns true if all letters in random_word have been guessed
  def won?
    random_word_array.all? { |letter| guessed_letters.include?(letter) }
  end

  # Returns true if user has made MAX_LIVES number of incorrect guesses
  def lost?
    (guessed_letters - random_word_array.uniq).length >= Game::MAX_LIVES
  end

  def in_progress?
    !won? && !lost?
  end

  private

  def random_word_array
    random_word.strip.split("")
  end
end
