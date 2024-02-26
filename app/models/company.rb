class Company < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, :phone, :segment,
            :status, :site, :category, :uf, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_email,
    against: [ :name, :email ],
    using: {
      tsearch: { prefix: true }
    }
end
