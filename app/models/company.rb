class Company < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, :phone, :segment,
            :status, :site, :category, :uf, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  # validações para definir status de aprovação do cadastro da empresa por adm.
  validates :status, inclusion: { in: %w[ativo inativo pendente] }
  validates :approval_status, inclusion: { in: [true, false] }
end
