class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @company = Company.find(params[:company_id])
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
    redirect_to favorites_path, notice: 'Companhia exluída dos favoritos'
  end

  private

  def favorite_params
    params.require(:company).permit(:company_id)
  end
end
