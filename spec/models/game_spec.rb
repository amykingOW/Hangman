require 'rails_helper'

describe Game do
  let(:letters) { ["a", "b", "c"] }
  let(:game_name) { "game1" }
  let(:game) do
    game = Game.new(name: game_name, random_word: "abc")
    game.guesses = letters.map { |letter| Guess.new(letter: letter) }
    game
  end

  context "When creating a new Game" do
    let(:letters) { [] }

    it "should have a name" do
      expect(game.name).to eq game_name
    end
  end

  context "When all letters have been guessed correctly" do
    it "won? should return true" do
      expect(game).to be_won
    end

    it "lost? should return false" do
      expect(game).to_not be_lost
    end

    it "in_progress? should return false" do
      expect(game).to_not be_in_progress
    end
  end

  context "When 9 letters have been guessed incorrectly" do
    let(:letters) { ["d", "e", "f", "g", "h", "i", "j", "k", "l"] }

    it "lost? should return true" do
      expect(game).to be_lost
    end

    it "won? should return false" do
      expect(game).to_not be_won
    end

    it "in_progress? should return false" do
      expect(game).to_not be_in_progress
    end
  end

  context "When less than 9 letters have been guessed incorrectly" do
    let(:letters) { ["d", "e", "f", "g", "h", "i", "j"] }

    it "in_progress? should return true" do
      expect(game).to be_in_progress
    end
    
    it "lost? should return false" do
      expect(game).to_not be_lost
    end

    it "won? should return false" do
      expect(game).to_not be_won
    end
  end

  describe "#guessed_letters" do
    context "no guesses have been made" do
      let(:letters) { [] }

      it "should return an empty array" do
        expect(game.guessed_letters).to eq []
      end
    end

    context "guesses have been made" do
      it "should return an array with the guessed letters" do
        expect(game.guessed_letters).to eq letters
      end
    end
  end

  describe "#build_solved_so_far" do
    let(:letters) { ["a", "b"] }
    
    it "returns correct array" do
      expect(game.build_solved_so_far).to eq ["a", "b", nil]
    end
  end
end
