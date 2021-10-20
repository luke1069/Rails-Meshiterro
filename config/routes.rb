Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:'homes#top'
  resources:post_images,only:[:new,:create,:index,:show,:destroy]do
    resource:favorites,only:[:create,:destroy]
    # 単数形にすることで、idがHTTPメソッドのリクエストへの回答に含まれない。
    resources:post_comments,only:[:create,:destroy]
  end

 resources:users,only:[:show,:edit,:update]

end
