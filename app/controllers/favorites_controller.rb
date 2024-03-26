class FavoritesController < ApplicationController
  before_action :set_company, only: %i[create destroy]

  def index
    @page_name = 'Home'
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, company_id: params[:company_id])
    if @favorite.save
      redirect_to company_path(@company), notice: 'Companhia adicionada aos favoritos!'
    else
      redirect_to company_path(@company), alert: 'Ocorreu um erro!'
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, company_id: params[:company_id])
    @favorite.destroy
    redirect_to company_path(@company), notice: 'Companhia exluída dos favoritos'
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def favorite_params
    params.require(:company).permit(:company_id)
  end
end
