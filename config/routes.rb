Rails.application.routes.draw do
  # rota para index das empresas sem aprovação
  resources :companies

  root to: "pages#home"
end
