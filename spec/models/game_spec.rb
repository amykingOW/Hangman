require '/Users/amyking/Documents/hangman/spec/rails_helper.rb'
require '/Users/amyking/Documents/hangman/app/models/game.rb'

describe Game do
  def create_game(random_word)
    game = Game.new(name: "game1", random_word: random_word)
  end

  def create_guesses(letters)
    letters.map { |letter| Guess.new(letter: letter) }
  end

  context "When create a new Game" do
    it "should have a name" do
      game = create_game("abc")
      expect(game).to have_attributes(name: "game1")
    end
  end

  context "When all letters have been guessed" do
    it "won? should return true" do
      game = create_game("abc")
      guesses = create_guesses(["a", "b", "c"])
      game.guesses = guesses
      won = game.won?
      expect(won).to eq true
    end
  end

  context "When no letters have been guessed" do
    it "won? should return false" do
      game = create_game("abc")
      guesses = create_guesses(["d", "e", "f"])
      game.guesses = guesses
      won = game.won?
      expect(won).to eq false
    end
  end

end