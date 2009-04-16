ActionController::Routing::Routes.draw do |map|
  map.resources :users, :collection => { :myasks => :get }, :member => {:panel => :get, :edit_userinfo => :get } do |user|
    user.resources :messages, :collection => {:message_to => :put, :trashbox => :put }, 
      :member => {:message_delete => :delete, :reply => :put, :renew => :put }
    user.resources :friends, :collection => {:myrequest => :get, :needpassed => :get }
    user.resources :user_infos
    user.resources :space
    user.resources :comments
    user.resources :entries, :member => {:add_recommend => :get} do |entry|
      entry.resources :comments
    end
    user.resources :albums do |album|
      album.resources :photos, :member => {:set_avatar => :put, :set_primary => :put } do |photo|
        photo.resources :comments
      end
    end
  end

  map.resources :boards
  map.resources :events, :collection => {:category_events => :get } do |event|
    event.resources :comments
  end

  map.resources :asks, :member => {:close_ask => :put, :askuser => :get },:collection => {:contribution => :put, :category_asks => :put } do |ask|
    ask.resources :answers, :member => {:set_answer => :put }
  end
  map.askhome '/askhome', :controller => 'asks', :action => 'home'

  map.resources :company, :collection => {:category_index => :put} do |company|
    company.resources :comments
  end

  map.resources :shops, :collection => {:category_shops => :put} do |shop|
    shop.resources :comments
  end

  map.resources :products do |product|
    product.resources :reservations
    product.resources :shop_photos
    product.resources :comments
  end

  map.resources :infos, :collection => {:category_infos => :put } do |info|
    info.resources :comments
  end

  map.resources :businesses,:collection => {:category_bus => :put}, :member => {:add_gone => :get, :add_want => :get} do |b|
    b.resources :serve_photos
  end
  map.resources :vote
  map.votes '/votes', :controller => 'vote', :action => 'home'

  map.resources :forums do |forum|
    forum.resources :topics do |topic|
      topic.resources :posts
    end
  end

  map.namespace :admin do |a|
    a.resources :theme_categories do |category|
      category.resources :themes
    end
    a.resources :themes
    a.resources :forum_categories
    a.resources :ask_categories
    a.resources :info_categories
    a.resources :event_categories
    a.resources :serve_categories
    a.resources :shop_categories
    a.resources :board_categories
    a.resources :company_categories
    a.resources :users, :member => {:enabled => :get}
    a.resources :grades
    a.resources :messages, :member => {:reply => :put, :renew => :put}
  end

  

  map.resources :comments

  map.login '/login', :controller => 'account', :action => 'login'
  map.logout '/logout', :controller => 'account', :action => 'logout'
  map.signup '/signup', :controller => 'account', :action => 'new'
  map.adminhome '/adminhome', :controller => 'admin/home', :action => 'index'
  map.home '', :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
