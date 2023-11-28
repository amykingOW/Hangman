class GuessesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.create(guess_params)
    
    flash[:messages] = @guess.errors.full_messages_for(:letter)
    redirect_to game_path(@game)
  end

  private
    def guess_params
      params.require(:guess).permit(:letter)
    end
end
