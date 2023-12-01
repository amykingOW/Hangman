class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.update(random_word: Game.load_words.sample)
      redirect_to @game
    else
      flash.now[:messages] = @game.errors.full_messages_for(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end