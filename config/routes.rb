Rails.application.routes.draw do
  # rota para index das empresas sem aprovação
  get 'companies/pending_approval', to: 'companies#pending_approval', as: 'pending_approval_companies'
  resources :companies do
    resources :favorites, only: %i[create destroy]
    member do
      post 'vote_toggle'
    end
  end


  # rota para aprovação da empresa pelo admin
  patch 'companies/:id/approve', to: 'companies#approve', as: 'approve_company'

  # rota para rejeitar aprovação da empresa pelo admin
  delete 'companies/:id/reject', to: 'companies#reject', as: 'reject_company'

  devise_for :users
  root to: "pages#home"
  get 'favorites', to: 'favorites#index'
end
