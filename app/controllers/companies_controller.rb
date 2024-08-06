class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy]

  def index
    @page_name = 'Empresas'
    @companies = filtered_companies
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company,
                  notice: 'Companhia criada com sucesso, um administrador avaliará os dados antes da publicação.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy
    redirect_to companies_path, status: :see_other
  end

  private

  def filtered_companies
    companies = Company.visible

    companies = companies.search_by_name_and_email(params[:query]) if params[:query].present?

    companies = companies.where(uf: params[:uf]) if params[:uf].present?

    companies = companies.where(segment: params[:segment]) if params[:segment].present?

    companies = companies.where(category: params[:category]) if params[:category].present?

    companies.order(:status)
  end

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name, :email, :contact_email, :phone, :address, :segment,
      :size, :job_offer, :ruby_stack, :status, :site, :category, :uf, :color, :vote_type
    )
  end
end
