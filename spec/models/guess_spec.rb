require 'rails_helper'

describe Guess do
  let(:letters) { ["a", "b", "c"] }
  let(:invalid_guesses_array) { ["a", "a", "9", "*", "aa", "A"] }
  let(:game) do
    game = Game.new(name: "game1", random_word: "abc")
    game.guesses = letters.map { |letter| Guess.new(letter: letter) }
    game
  end

  context "When validating valid letters guessed" do
    it "single lowercase letters should be valid" do
      expect(game.guesses[0]).to be_valid
    end

    it "unique letters should be valid" do
      expect(game.guesses[0]).to be_valid
    end
  end

  context "When validating invalid letters guessed" do
    let(:letters) { invalid_guesses_array }

    it "numbers should not be valid" do
      expect(game.guesses[2]).to_not be_valid
    end

    it "symbols should not be valid" do
      expect(game.guesses[3]).to_not be_valid
    end

    it "non single letters should not be valid" do
      expect(game.guesses[4]).to_not be_valid
    end

    it "capital letters should not be valid" do
      expect(game.guesses[5]).to_not be_valid
    end
  end
end
