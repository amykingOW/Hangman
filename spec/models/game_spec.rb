require '/Users/amyking/Documents/hangman/spec/rails_helper.rb'
require '/Users/amyking/Documents/hangman/app/models/game.rb'

describe Game do
  def create_game(random_word, letters_guessed)
    game = Game.new(name: "game1", random_word: random_word)
    game.guesses = create_guesses(letters_guessed)
    game
  end

  def create_guesses(letters)
    letters.map { |letter| Guess.new(letter: letter) }
  end

  context "When create a new Game" do
    it "should have a name" do
      game = create_game("abc", [])
      expect(game).to have_attributes(name: "game1")
    end
  end

  context "When all letters have been guessed" do
    it "won? should return true" do
      won = create_game("abc", ["a", "b", "c"]).won?
      expect(won).to eq true
    end
  end

  context "When no letters have been guessed" do
    it "won? should return false" do
      won = create_game("abc", ["d", "e", "f"]).won?
      expect(won).to eq false
    end
  end

end