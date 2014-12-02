Rails.application.routes.draw do
  root to: "pages#index"
  get 'signin' => 'pages#signin'
end
