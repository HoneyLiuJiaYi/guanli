Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  match '/manage/rider' => 'manage#manageRider', :via => [:get, :post]

  match '/stop/rider' => 'manage#stopRider', :via => [:get, :post]

  match '/manage/merchant' => 'manage#manageMerchant', :via => [:get, :post]

  match '/stop/merchant' => 'manage#stopMerchant', :via => [:get, :post]

  match '/manage/user' => 'manage#User', :via => [:get, :post]

  match '/review/merchant' => 'review#reviewMerchant', :via => [:get, :post]

  match '/post/merchant' => 'review#postMerchant', :via => [:get, :post]

  match '/review/rider' => 'review#reviewRider', :via => [:get, :post]

  match '/post/rider' => 'review#postRider', :via => [:get, :post]

  match '/login' => 'login#create', :via => [:get, :post]
end
