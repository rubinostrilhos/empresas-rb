class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy approve reject vote_page vote_toggle]
  before_action :authenticate_user!

  def index
    @page_name = "Empresas"
    @companies = filtered_companies
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

    if @company.save
      admin = current_user.is_admin?

      @company.update_attribute(:approval_status, admin)

      redirect_to @company,
                  notice: "Companhia criada com sucesso, um administrador avaliará os dados antes da publicação."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user.is_admin? == true || (@company.user_id == current_user.id && @company.approval_status == false)
      redirect_to company_path(@company), notice: "Você não tem permissão para editar esta empresa."
    end
  end

  def update
    if current_user.is_admin? == true || (@company.user_id == current_user.id && @company.approval_status == false)
      # Acresentar mensagem de erro caso os parametros não tenham sido fornecidos
      @company.update(company_params)
      redirect_to company_path(@company)
    else
      redirect_to company_path(@company), notice: "Você não tem permissão para editar esta empresa."
    end
  end

  def destroy
    if current_user.is_admin? == true
      @company.destroy
      redirect_to companies_path, status: :see_other
    else
      redirect_to company_path(@company), notice: "Você não tem permissão para deletar esta empresa."
    end
  end

  # metodos para aprovação da empresa por um admin
  def pending_approval
    if current_user.is_admin?
      @pending_companies = Company.where(approval_status: false)
    else
      redirect_to(companies_path,
                  notice: "Você não tem permissão para acessar esta página.")
    end
  end

  def approve
    if current_user.is_admin? == true
      @company.update!(approval_status: true)
      redirect_to pending_approval_companies_path, notice: "Empresa aprovada com sucesso."
    else
      redirect_to companies_path, notice: "Você não tem permissão para aprovar esta empresa."
    end
  end

  def reject
    if current_user.is_admin? == true
      @company.destroy
      redirect_to pending_approval_companies_path, notice: "Empresa rejeitada com sucesso."
    else
      redirect_to companies_path, notice: "Você não tem permissão para rejeitar esta empresa."
    end
  end

  def vote_page
    @vote = company.votes.find_by(user_id: current_user.id)
  end

  def vote_toggle
    @vote = @company.votes.find_by(user_id: current_user.id)
    if @vote.nil?
      @company.votes.create(user: current_user, usefulness: params[:usefulness])
    elsif params[:usefulness] == @vote.usefulness
      @vote.destroy
    else
      @vote.toggle_usefulness
    end
    redirect_to @company
  end

  private

  def filtered_companies
    companies = Company.visible

    companies = companies.search_by_name_and_email(params[:query]) if params[:query].present?

    companies = companies.where(uf: params[:uf]) if params[:uf].present?

    companies = companies.where(segment: params[:segment]) if params[:segment].present?

    companies = companies.where(category: params[:category]) if params[:category].present?

    companies = companies.where(approval_status: true) unless current_user.is_admin?

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
