require 'rails_helper'

describe GuessesController do
  let(:game) do
    game = Game.create!(name: "game1", random_word: "abc")
    ["a", "b", "c"].each { |letter| Guess.create!(letter: letter, game: game) }
    game
  end

  describe "POST #create" do
    let(:post_create) { post game_guesses_path(game), params: { guess: { letter: letter } } }

    context "When a valid guess is made" do
      let(:letter) { "d" }

      it "should save the new guess in the database" do
        expect { post_create }.to change { game.guesses.count }.by(1)
      end

      it "should redirect to the guess' game" do
        post_create
        expect(response).to be_redirect
      end
    end

    context "When an invalid guess is made" do
      let(:letter) { "9" }

      it "should not save the new guess in the database" do
        expect { post_create }.to_not change { game.guesses.count }
      end

      it "should redirect to the game currently in progress" do
        post_create
        expect(response).to be_redirect
      end
    end
  end
end
