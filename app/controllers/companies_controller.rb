class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy approve reject]

  def index
    if params[:query].present?
      @companies = Company.search_by_name_and_email(params[:query])
                          .where(approval_status: true)
                          .where(status: ['Ativo', 'Pendente'])
                          .order(:status)
    else
      @companies = Company.where(approval_status: true, status: ['Ativo', 'Pendente'])
                          .order(:status)
    end
  end

  def show
    @favorite = Favorite.find_by(user_id: current_user.id, company_id: @company.id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    current_user.is_admin? ? @company.update_attribute(:approval_status, true) : @company.update_attribute(:approval_status, false)

    if @company.save
      redirect_to @company
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

  # metodos para aprovação da empresa por um admin
  def pending_approval
    @pending_companies = Company.where(approval_status: false)
  end

  def approve
    @company.update!(approval_status: true)
    redirect_to pending_approval_companies_path, notice: 'Empresa aprovada com sucesso.'
  end

  def reject
    @company.destroy
    redirect_to pending_approval_companies_path, notice: 'Empresa rejeitada com sucesso.'
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name, :email, :contact_email, :phone, :address, :segment,
      :size, :job_offer, :ruby_stack, :status, :site, :category, :uf
    )
  end
end
