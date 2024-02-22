class Company < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
