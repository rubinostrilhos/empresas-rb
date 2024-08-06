class Company < ApplicationRecord
  CATEGORIES = %w[Scale-up Software-house Startup Grupo].sort
  SEGMENTS = %w[Agro IT Finance Transport Marketing Food Tourism Healthcare Education
                Recruitment Fashion Media Fitness Service Retail Construction].sort

  VISIBLE_STATUSES = %w[Ativo Pendente].freeze

  scope :search_by_name_and_email, ->(query) { where('lower(name) LIKE ? OR lower(email) LIKE ?', "%#{query.downcase}%", "%#{query.downcase}%") }
  scope :visible, -> { all }

  validates :name, :phone, :segment,
            :status, :site, :category, :uf, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  # validações para definir status de aprovação do cadastro da empresa por adm.
  validates :status, inclusion: { in: %w[Inativo] | VISIBLE_STATUSES }
  # validates :approval_status, inclusion: { in: [true, false] }reloa
end
