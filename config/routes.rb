Rails.application.routes.draw do
  devise_for :users
  
  resources :institutions, only: [] do
    resources :people do
      member do
        get "parents/search", action: :parent_search, as: :parent_search
        post "parents/:parent_id", action: :relate_parent, as: :relate_parent
      end
      
      resources :enrollments
    end
    
    resources :grades do
      resources :meetings
    end
  end
  
  get "/" => "application#home"
end
