require '/Users/amyking/Documents/hangman/spec/rails_helper.rb'
require '/Users/amyking/Documents/hangman/app/models/game.rb'

describe Game do
  RANDOM_WORD = "abc"
  ABC_ARRAY = ["a", "b", "c"]
  DEFGHIJKL_ARRAY = ["d", "e", "f", "g", "h", "i", "j", "k", "l"]
  DEFGHIJ_ARRAY = ["d", "e", "f", "g", "h", "i", "j"]

  def create_game(letters_guessed)
    game = Game.new(name: "game1", random_word: RANDOM_WORD)
    game.guesses = create_guesses(letters_guessed)
    game
  end

  def create_guesses(letters)
    letters.map { |letter| Guess.new(letter: letter) }
  end

  context "When create a new Game" do
    it "should have a name" do
      game = create_game([])
      expect(game).to have_attributes(name: "game1")
    end
  end

  context "When all letters have been guessed correctly" do
    it "won? should return true" do
      won = create_game(ABC_ARRAY).won?
      expect(won).to eq true
    end

    it "lost? should return false" do
      lost = create_game(ABC_ARRAY).lost?
      expect(lost).to eq false
    end

    it "in_progress? should return false" do
      in_progress = create_game(ABC_ARRAY).in_progress?
      expect(in_progress).to eq false
    end
  end

  context "When 9 letters have been guessed incorrectly" do
    it "lost? should return true" do
      lost = create_game(DEFGHIJKL_ARRAY).lost?
      expect(lost).to eq true
    end

    it "won? should return false" do
      won = create_game(DEFGHIJKL_ARRAY).won?
      expect(won).to eq false
    end

    it "in_progress? should return false" do
      in_progress = create_game(DEFGHIJKL_ARRAY).in_progress?
      expect(in_progress).to eq false
    end
  end

  context "When less than 9 letters have been guessed incorrectly" do
    it "lost? should return false" do
      lost = create_game(DEFGHIJ_ARRAY).lost?
      expect(lost).to eq false
    end

    it "won? should return false" do
      won = create_game(DEFGHIJ_ARRAY).won?
      expect(won).to eq false
    end

    it "in_progress? should return true" do
      in_progress = create_game(DEFGHIJ_ARRAY).in_progress?
      expect(in_progress).to eq true
    end
  end

end