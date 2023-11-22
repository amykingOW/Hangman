class Guess < ApplicationRecord
  belongs_to :game
  validates :letter, format: { with: /\A[a-z]{1}\Z/, message: "Guess a single letter from a-z (case sensitive)." }
end
