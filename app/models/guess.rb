class Guess < ApplicationRecord
  belongs_to :game
  validates :letter, uniqueness: { scope: :game }, format: { with: /\A[a-z]{1}\Z/ }
end
