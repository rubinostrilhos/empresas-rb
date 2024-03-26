class Vote < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :company_id
  validates :usefulness, inclusion: { in: %w[up down] }

  def toggle_usefulness
    if usefulness == "up"
      update(usefulness: "down")
    else
      update(usefulness: "up")
    end
  end
end
