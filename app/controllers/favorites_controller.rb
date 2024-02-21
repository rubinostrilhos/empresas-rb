class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  # def create
  #   @favorite = Favorite.new
  #   @user = current_user
  #   @company = Company.find(params[:company_id])


#     @favorite = Favorite.new(user_id: current_user.id, company_id: params[:company_id])
#     if @favorite.save
#       redirect_to companies_path, notice: 'Companhia adicionada aos favoritos!'
#     else
#       redirect_to companies_path, alert: 'Ocorreu um erro!'
#     end
  # end

#   def destroy
#     @favorite = current_user.favorites.find_by(company_id: params[:company_id])
#     if @favorite.destroy
#       redirect_to companies_path, notice: 'Company removed from favorites!'
#     else
#       redirect_to companies_path, alert: 'Failed to remove company from favorites!'
#     end
#   end
end
