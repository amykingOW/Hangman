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

  context "When all letters have been guessed correctly" do
    it "won? should return true" do
      won = create_game("abc", ["a", "b", "c"]).won?
      expect(won).to eq true
    end

    it "in_progress? should return false" do
      in_progress = create_game("abc", ["a", "b", "c"]).in_progress?
      expect(in_progress).to eq false
    end
  end

  context "When 9 letters have been guessed incorrectly" do
    it "lost? should return true" do
      lost = create_game("abc", ["d", "e", "f", "g", "h", "i", "j", "k", "l"]).lost?
      expect(lost).to eq true
    end

    it "in_progress? should return false" do
      in_progress = create_game("abc", ["d", "e", "f", "g", "h", "i", "j", "k", "l"]).in_progress?
      expect(in_progress).to eq false
    end
  end

  context "When less than 9 letters have been guessed incorrectly" do
    it "lost? should return false" do
      lost = create_game("abc", ["d", "e", "f", "g", "h", "i", "j"]).lost?
      expect(lost).to eq false
    end

    it "won? should return false" do
      won = create_game("abc", ["d", "e", "f", "g", "h", "i", "j"]).won?
      expect(won).to eq false
    end

    it "in_progress? should return true" do
      in_progress = create_game("abc", ["d", "e", "f", "g", "h", "i", "j"]).in_progress?
      expect(in_progress).to eq true
    end
  end

end