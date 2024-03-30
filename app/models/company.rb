class Company < ApplicationRecord
  CATEGORIES = %w[Scale-up Software-house Startup Grupo].sort
  SEGMENTS = %w[Agro IT Finance Transport Marketing Food Tourism Healthcare Education
             Recruitment Fashion Media Fitness Service Media Retail Construction].sort


  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :votes, dependent: :destroy

  validates :name, :phone, :segment,
            :status, :site, :category, :uf, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  # validações para definir status de aprovação do cadastro da empresa por adm.
  validates :status, inclusion: { in: %w[Ativo Inativo Pendente] }
  # validates :approval_status, inclusion: { in: [true, false] }reloa

  include PgSearch::Model
  pg_search_scope :search_by_name_and_email,
                  against: %i[name email],
                  using: {
                    tsearch: { prefix: true }
                  }
end
