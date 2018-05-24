Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only:[:create, :destroy] #createとdestroyのルーティングだけを使うから！
  end
  # なんでこれresourcesとかいう書き方でいけるんだっけ？

  root 'posts#index' # rootの設定！(初期画面としてどのコントローラーのアクションを呼ぶのかを定義！)
end
