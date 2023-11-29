require '/Users/amyking/Documents/hangman/spec/rails_helper.rb'
require '/Users/amyking/Documents/hangman/app/models/game.rb'

describe Game do
  def create_game
    game = Game.new(name: "game1")
  end

  context "When create a new Game" do
    it "should have a name" do
      game = create_game
      expect(game).to have_attributes(name: "game1")
    end
  end

end