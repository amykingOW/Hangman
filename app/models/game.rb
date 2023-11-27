class Game < ApplicationRecord
  MAX_GUESSES = 9

  has_many :guesses, dependent: :destroy
  validates :name, presence: true

  def self.load_words
    File.readlines("words.txt")
  end

  def self.print_solved_so_far(game)
    @game = game
    @random_word_array = @game.random_word.strip.split("")
    @guessed_so_far = Array.new(@random_word_array.length(), "_")

    get_guessed_letters
    check_letters

    @guessed_so_far.join(" ")
  end

  private

  # Puts all guessed letters in an array
  def self.get_guessed_letters
    @guessed_letters = Array.new
    @game.guesses.each { |guess| @guessed_letters << guess.letter }
  end

  # If a letter in the random word has been guessed _ is replaced with the letter
  def self.check_letters
    for i in 0...@random_word_array.length
      letter_in_word = @random_word_array[i]
      if @guessed_letters.include?(letter_in_word)
        @guessed_so_far[i] = letter_in_word
      end
    end
  end

end

