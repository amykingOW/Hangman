require 'rails_helper'

describe Guess do
  let(:invalid_guesses_array) { ["a", "a", "9", "*", "aa", "A"] }
  let(:game) { Game.new(name: "game1", random_word: "abc") }
  let(:letter) { "a" }
  let(:guess) { Guess.new(letter: letter, game: game) }

  context "When validating valid letters guessed" do
    it "single lowercase letters should be valid" do
      expect(guess).to be_valid
    end
  end

  context "When validating a number" do
    let(:letter) { "9" }

    it "numbers should not be valid" do
      expect(guess).to_not be_valid
    end
  end

  context "When validating a symbol" do
    let(:letter) { "*" }

    it "symbols should not be valid" do
      expect(guess).to_not be_valid
    end
  end

  context "When validating a non single letter" do
    let(:letter) { "aa" }

    it "non single letters should not be valid" do
      expect(guess).to_not be_valid
    end
  end

  context "When validating a capital letter" do
    let(:letter) { "A" }

    it "capital letters should not be valid" do
      expect(guess).to_not be_valid
    end
  end
end
