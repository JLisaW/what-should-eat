class Mood < ApplicationRecord
  belongs_to :user

  validates :description, prescence: true
end