class Guess < ApplicationRecord
  belongs_to :game
  validates :letter, format: { with: /\A[a-z]{1}\Z/ }

  def self.check_guess(game)
    @game = game
    if won?
      return
    else
      lost?
    end
  end

  private

  # Returns true if the user has won
  def self.won?
    random_word_array = @game.random_word.strip.split("")
    get_guessed_letters

    # Go through each letter in random_word and check if it has been guessed
    for i in 0...random_word_array.length
      letter_in_word = random_word_array[i]
      if !@guessed_letters.include?(letter_in_word)
        return false
      end
    end
    @game.update(status: "Won")
    true
  end

  # Checks if the user lost
  def self.lost?
    if @game.guesses.length() >= Game::MAX_GUESSES
      @game.update(status: "Lost")
    end
  end

  # Puts all guessed letters in an array
  def self.get_guessed_letters
    @guessed_letters = Array.new
    @game.guesses.each { |guess| @guessed_letters << guess.letter }
  end
end
