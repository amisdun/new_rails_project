Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'admin_signup/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'admission_template/index'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'admission_template/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'admission_template/show'
    end
  end

  namespace :api do
    namespace :v1 do
      put 'admission_template/update'
    end
  end

  namespace :api do
    namespace :v1 do
      delete 'admission_template/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'receipt_template/index'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'receipt_template/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'receipt_template/show'
    end
  end

  namespace :api do
    namespace :v1 do
      put 'receipt_template/update'
    end
  end

  namespace :api do
    namespace :v1 do
      delete 'receipt_template/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'user_signup/create'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'user_signin/create'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'admin_signin/create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
