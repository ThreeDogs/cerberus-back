require 'sidekiq/web'

CerberusBack::Application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"
  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do
      resources :apks, only: [] do
        member do
          get 'apk_conversion_status'
          post 'create_device'
          delete 'destroy_device'
        end
      end

      resources :total_reports, only: [] do
        member do
          get 'test_rank_status'
          get 'test_progress'
          get 'device_failure_detail'
          get 'test_errors'
          get 'test_rank_rate'
          get 'detail_report_list'
          get 'device_report_list'
          get 'test_report_list'
          get 'filter'
        end
      end

      resources :detail_reports, only: [:create] do
        collection do
          post 'upload_screenshot'
          post 'finish_test'
        end
        member do
          get 'get_report_infos'
          get 'get_memory_infos'
          get 'get_cpu_infos'
          get 'get_network_infos'
          get 'get_battery_infos'
          get 'get_frame_draw_times'
        end
      end

      resources :test_scenarios, only: [:create, :index] do
        member do
          get "motion_event_list"
        end
        collection do
          get 'filter'
        end
      end
      
      resources :motion_events, only: [:create]
    end
  end

  resources :projects do
    resources :apks
    resources :total_reports
    resources :test_scenarios
  end

  resources :apks do
    resources :total_reports
  end

  resources :total_reports, only: [] do
    resources :crashes, only: [:show, :index]
    resources :devices, only: [:index]
    resources :detail_reports
    member do
      get 'start_test'
      get 'tests'
    end
  end

  resources :detail_reports, only: [] do
    member do
      get 'memory'
      get 'cpu'
      get 'battery'
      get 'network'
      get 'frame_draw_time'
    end
  end

  devise_for :users, path_names: {sign_in: 'login', sing_out: 'logout'}

  root 'main#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
