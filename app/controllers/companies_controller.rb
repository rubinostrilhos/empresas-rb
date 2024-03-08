class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy approve reject]

  def index
    @page_name = 'Empresas'

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
    @company.user_id = current_user.id
    current_user.is_admin? ? @company.update_attribute(:approval_status, true) : @company.update_attribute(:approval_status, false)

    if @company.save
      redirect_to @company
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user.is_admin? == true || (@company.user_id == current_user.id && @company.approval_status == false)
      redirect_to company_path(@company), notice: 'Você não tem permissão para editar esta empresa.'
    end
  end

  def update
    if current_user.is_admin? == true || (@company.user_id == current_user.id && @company.approval_status == false)
      @company.update(company_params)
      redirect_to company_path(@company)
    else
      redirect_to company_path(@company), notice: 'Você não tem permissão para editar esta empresa.'
    end
  end

  def destroy
    if current_user.is_admin? == true
      @company.destroy
      redirect_to companies_path, status: :see_other
    else
      redirect_to company_path(@company), notice: 'Você não tem permissão para deletar esta empresa.'
    end
  end

  # metodos para aprovação da empresa por um admin
  def pending_approval
    current_user.is_admin? ? @pending_companies = Company.where(approval_status: false) : redirect_to(companies_path, notice: 'Você não tem permissão para acessar esta página.')
  end

  def approve
    if current_user.is_admin? == true
      @company.update!(approval_status: true)
      redirect_to pending_approval_companies_path, notice: 'Empresa aprovada com sucesso.'
    else
      redirect_to companies_path, notice: 'Você não tem permissão para aprovar esta empresa.'
    end
  end

  def reject
    if current_user.is_admin? == true
      @company.destroy
      redirect_to pending_approval_companies_path, notice: 'Empresa rejeitada com sucesso.'
    else
      redirect_to companies_path, notice: 'Você não tem permissão para rejeitar esta empresa.'
    end
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
