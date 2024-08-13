class Company < ApplicationRecord
  CATEGORIES = %w[Scale-up Software-house Startup Grupo].sort
  SEGMENTS = %w[Agro IT Finance Transport Marketing Food Tourism Healthcare Education
                Recruitment Fashion Media Fitness Service Retail Construction].sort

  SIZE = %w[1-10 11-100 101-500 501-1000 1000+]

  LOCALES = %w[REMOTO AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO]

  scope :search_by_name_and_email, ->(query) { where("lower(name) LIKE ? OR lower(email) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%") }
  scope :visible, -> { all }

  validates :name, :site, :uf, :category, :segment, :size, :color, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
end
