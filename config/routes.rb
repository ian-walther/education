Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :college_search do
    get :college_list
  end

  root 'college_searches#index'
end
