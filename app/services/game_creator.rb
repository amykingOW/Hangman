class GameCreator
  def initialize(game_params)
    @game_name = game_params[:name]
  end

  def call
    @game = Game.new{@game_name}
    @game.name = @game_name
    @game.random_word = Game.load_words.sample
    @game
  end
end