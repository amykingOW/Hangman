require 'rails_helper'

describe GamesController do
  let(:game_name) { "game1" }
  let(:game) do
    game = Game.create!(name: game_name, random_word: "abc")
    ["a", "b", "c"].each { |letter| Guess.create!(letter: letter, game: game) }
    game
  end

  describe "GET #index" do
    it "successful" do
      game
      get games_path
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "successful" do
      get game_path(id: game.id)
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "successful" do
      get new_game_path
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:post_create) { post games_path, params: { game: { name: game_name } } }

    context "When a valid name is entered" do
      it "should save the new game in the database" do
        expect { post_create }.to change { Game.count }.by(1)
      end

      it "should redirect to the game" do
        post_create
        expect(response).to be_redirect
      end
    end

    context "When an invalid name is entered" do
      let(:game_name) { "" }

      it "should not save the new game in the database" do
        expect { post_create }.to_not change { Game.count }
      end

      it "should re-render the new method" do
        post_create
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    let(:delete_game) { delete game_path(id: game.id) }

    it "should delete the game" do
      game
      expect { delete_game }.to change { Game.count }.by(-1)
    end

    it "should redirect to games#index" do
      delete_game
      expect(response).to be_redirect
    end
  end
end
