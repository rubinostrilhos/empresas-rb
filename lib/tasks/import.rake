require 'csv'

namespace :import do
  desc 'Importa empresas do arquivo CSV'
  task companies: :environment do
    file_path = 'lib/assets/data/2024.02.20_empresas_Ruby_on_Rails.csv'

    CSV.foreach(file_path, headers: true) do |row|
      companies_attributes = {
        name: row['Nome'].presence || "'FALTA #{:name}'",
        site: row['Site'].presence || "'FALTA #{:site}'",
        email: row['Contato'].presence || "'FALTA #{:email}'",
        phone: row['Telefone'].presence || "'FALTA #{:phone}'",
        category: row['Categoria'].presence || "'FALTA #{:category}'",
        segment: row['Setor'].presence || "'FALTA #{:segment}'",
        uf: row['UF'].presence || "'FALTA #{:uf}'"
      }

      Company.create!(companies_attributes)

    end
    puts 'Empresas importadas com sucesso!'
  end
end
