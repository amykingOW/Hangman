class Game < ApplicationRecord
  MAX_GUESSES = 9
  IN_PROGRESS = "In progress"

  has_many :guesses, dependent: :destroy
  validates :name, presence: true

  def self.load_words
    File.readlines("words.txt")
  end

  def check_guess
    if won?
      update!(status: "Won")
      return
    elsif lost?
      update!(status: "Lost")
    end
  end

  # Puts all guessed letters in an array
  def guessed_letters
    guesses.map { |guess| guess.letter }
  end

  # If a letter in the random word has been guessed _ is replaced with the letter
  def build_solved_so_far
    random_word_array.map { |letter| guessed_letters.include?(letter) ? letter : nil }
  end

  # Returns true if all letters in random_word have been guessed
  def won?
    random_word_array.all? { |letter| guessed_letters.include?(letter) }
  end

  # Checks if the user lost and updates game status accordingly
  def lost?
    guesses.length >= Game::MAX_GUESSES
  end

  def in_progress?
    !won? && !lost?
  end

  private

  def random_word_array
    random_word.strip.split("")
  end
end

