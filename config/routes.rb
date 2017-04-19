Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  match '/manage/rider' => 'manage#manageRider', :via => [:get, :post]

  match '/stop/rider' => 'manage#stopRider', :via => [:get, :post]

  match '/active/rider' => 'manage#activeRider', :via => [:get, :post]

  match '/manage/merchant' => 'manage#manageMerchant', :via => [:get, :post]

  match '/stop/merchant' => 'manage#stopMerchant', :via => [:get, :post]

  match '/active/merchant' => 'manage#activeMerchant', :via => [:get, :post]

  match '/manage/user' => 'manage#manageUser', :via => [:get, :post]

  match '/review/merchant' => 'review#reviewMerchant', :via => [:get, :post]

  match '/post/merchant' => 'review#postMerchant', :via => [:get, :post]

  match '/review/rider' => 'review#reviewRider', :via => [:get, :post]

  match '/post/rider' => 'review#postRider', :via => [:get, :post]

  match '/login' => 'login#create', :via => [:get, :post]

  match '/logout' => 'login#destroy', :via => [:get, :post]

  match '/show/admin' => 'addmin#showAdmin', :via => [:get, :post]

  match '/add/admin' => 'addmin#addAdmin', :via => [:get, :post]

  match '/remove/admin' => 'addmin#removeAdmin', :via => [:get, :post]

  match '/statistic/sex' => 'statistic#statisticSex', :via => [:get, :post]

  match '/edit/admin' => 'admin#edit', :via => [:get, :post]

  match '/category/list' => 'category#list', :via => [:get, :post]

  match '/product/edit' => 'product#edit', :via => [:get, :post]

  match '/user/list' => 'user#list', :via => [:get, :post]

  match '/user/stop' => 'user#stopUser', :via => [:get, :post]

  match '/user/active' => 'user#activeUser', :via => [:get, :post]

  match '/product/list' => 'product#list', :via => [:get, :post]

  match '/product/stop' => 'product#stopProduct', :via => [:get, :post]

  match '/category/stop' => 'category#stopCategory', :via => [:get, :post]

  match '/category/add' => 'category#addCategory', :via => [:get, :post]

  match '/product/add' => 'product#addProduct', :via => [:get, :post]

  match '/category/edit' => 'category#edit', :via => [:get, :post]

  #spring1 round2

  match '/admin/show/station' => 'admin#showAdminStation', :via => [:get, :post]

  match '/admin/show/region' => 'admin#showAdminRegion', :via => [:get, :post]

  match '/admin/destroy/station' => 'admin#destroyAdminStation', :via => [:get, :post]

  match '/region/all' => 'station#getAllRegions', :via => [:get, :post]

  match '/station/create' => 'station#createStation', :via => [:get, :post]

  match '/rider/show' => 'rider#showRider', :via => [:get, :post]

  match '/rider/bind' => 'rider#bindRider', :via => [:get, :post]

  match '/rider/unbindRider' => 'rider#unbindRider', :via => [:get, :post]
end
