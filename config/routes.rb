Rails.application.routes.draw do
  devise_for :users
  
  resources :institutions, only: [] do
    resources :people do
      member do
        post "parents/:parent_id", action: :relate_parent
      end
    end
  end
end
