class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates_uniqueness_of :company_id, scope: :user_id
end
