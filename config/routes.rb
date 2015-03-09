Rails.application.routes.draw do
  resources :people do
    member do
      post "parents/:parent_id", to: :relate_parent
    end
  end
end
