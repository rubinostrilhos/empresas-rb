class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy]

  def index
    @companies = Company.where(status: 'ativo', approval_status: true)
  end

  def show
    @favorite = Favorite.find_by(user_id: current_user.id, company_id: @company.id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.update_attribute(:approval_status, false)

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
