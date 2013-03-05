Gurulanguage::Application.routes.draw do
  get "pages/index"

  get "sessions/new"

  get "users/new" 

  get "sessions/login"
  get "users/signup"


  get "apply" => 'requests#apply'

  get "addSched" => 'schedules#addSched'
  get "schedulesList" => 'schedules#schedulesList'

  get "addRequest" => 'requests#addRequest'
  get "addRequest2" => 'requests#addRequest2'
  get "requestList" => 'requests#requestList'


  get 'tutorList' => 'users#tutorList'
  get 'tuteeList' => 'users#tuteeList'
  get 'myRequestList' => 'users#myRequestList'  #request list of tutee
  get 'requestNotif' => 'users#requestNotif', :controller=>"controllers" , :action=>"apply"
  get 'myScheduleList' => 'users#myScheduleList'  #schedule list of tutors
  get 'applicantsList' => 'users#applicantsList'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#login", :as => "log_in"
  get "sign_up" => "users#signup", :as => "sign_up"
  get "profile" => "users#profile", :as => "profile"
  get "prof" => "users#prof", :as => "prof"

  get 'adminHome' => 'administrators#home'
  get 'tutorsList' => 'administrators#tutors'
  get 'tuteesList' => 'administrators#tutees'
  get 'classesList' => 'administrators#classes'

  get 'tuteesHome' => 'tutees#home'
  get 'tutorsList2' => 'tutees#tutors'
  get 'tuteesList2' => 'tutees#tutees'
  get 'classesList2' => 'tutees#classes'
  get 'requestlog' => 'tutees#requestlog'
  get 'requestform'=> 'tutees#createRequestForm'

  get 'tutorHome' => 'tutors#home'
  get 'tutorsList3' => 'tutors#tutors'
  get 'tuteesList3' => 'tutors#tutees'
  get 'classesList3' => 'tutors#classes'
  get 'jobrequest' => 'tutors#jobrequest'

  get 'requests/:id/apply', :to =>'requests#apply', :as => 'apply'
  get 'requests/:id/approve', :to =>'requests#approve', :as => 'approve'

  get "prof" => 'users#prof'

  
  root :to => "users#index"
  
  resources :users
  resources :sessions
  resources :requests
  resources :schedules
  resources :pages




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
