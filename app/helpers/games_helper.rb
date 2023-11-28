module GamesHelper
  # Constructs a string with letters solved so far and _ for yet to be solved letters
  def print_solved_so_far(game)
    #game.build_solved_so_far.map { |letter| letter.present? ? letter : "_" }.joing(" ")
    game.build_solved_so_far.map { |letter| letter || "_"}.join(" ")
  end
end