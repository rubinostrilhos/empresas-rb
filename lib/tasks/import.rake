# require 'csv'

# namespace :import do
#   desc 'Importa empresas do arquivo CSV'
#   task companies: :environment do
#     file_path = 'lib/assets/data/2024.02.20_empresas_Ruby_on_Rails.csv'

#     CSV.foreach(file_path, headers: true) do |row|
#       companies_attributes = {
#         name: row['Nome'].presence || "'FALTA #{:name}'",
#         site: row['Site'].presence || "'FALTA #{:site}'",
#         email: row['Contato'].presence || "faltaoemail@email.com",
#         phone: row['Telefone'].presence || "'FALTA #{:phone}'",
#         category: row['Categoria'].presence || "'FALTA #{:category}'",
#         segment: row['Setor'].presence || "'FALTA #{:segment}'",
#         uf: row['UF'].presence || "'FALTA #{:uf}'"
#       }

#       Company.create!(companies_attributes)

#     end
#     puts 'Empresas importadas com sucesso!'
#   end
# end

require 'csv'

namespace :import do
  desc 'Importa empresas do arquivo CSV'
  task companies: :environment do
    file_path = Rails.root.join('lib', 'assets', 'data', '2024.02.20_empresas_Ruby_on_Rails.csv')

    CSV.foreach(file_path, headers: true) do |row|
      company_attributes = {
        name: row['Nome'].presence || "FALTA NOME",
        site: row['Site'].presence || "FALTA SITE",
        email: row['Contato'].presence || "faltaoemail@email.com",
        phone: row['Telefone'].presence || "FALTA TELEFONE",
        category: row['Categoria'].presence || "FALTA CATEGORIA",
        segment: row['Setor'].presence || "FALTA SETOR",
        uf: row['UF'].presence || "FALTA UF",
        status: row['Status'].presence || "Pendente" # Supondo que "Pendente" seja um valor padrão aceitável
      }

      company = Company.new(company_attributes)

      if company.valid?
        company.save
        puts "Empresa importada com sucesso: #{company.name}"
      else
        puts "Falha ao importar empresa devido a: #{company.errors.full_messages.join(", ")} - Dados: #{company_attributes.inspect}"
      end
    end

    puts 'Processo de importação de empresas concluído!'
  end
end
