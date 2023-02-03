Rails.application.routes.draw do
  resources :candidates do
  member do
    post :vote
    #  把路徑接在candidates/:id 的後面
  end
  
  # collection do
  #   post :vote
    # 不會保留 :id
  # end
end
end
