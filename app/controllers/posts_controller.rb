class PostsController < ApplicationController
  #Convention over Configuration(CoC)
  #コードの記述量を減らす為につらつら設定とか書くんじゃなくて、規則として定めちゃおう！って感じ

  def index
    # Postモデルのインスタンスを作成、その並び順を新しいもの順に並び替え→変数@postsに格納
    @posts = Post.all.order(created_at: 'desc')
  end

  # 個々の記事を表示する為のアクション
  def show
    @post = Post.find(params[:id]) #idで記事を取って来てそれをインスタンス変数@postに格納
    # params[:id]ってなってるのはroutesで:idで設定されているから！
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    # @post = Post.new(params[:post])
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params)

    if @post.save #saveが成功した時
      redirect_to posts_path
    else #saveが失敗した時
      # render plain: @post.errors.inspect
      render 'new'
    end

    # 投稿内容を編集する為のアクション
    def edit
      @post = Post.find(params[:id])
      logger.debug("===================")
      logger.debug(@post)
      logger.debug("===================")
    end

    # 編集内容を保存する為のアクション
    def update
      @post = Post.find(params[:id]) #IDで投稿を取得
      if @post.update(post_params)
        redirect_to posts_path #記事一覧に戻る
      else
        render 'edit'#エラーメッセージを表示した状態でeditアクションのビューに飛ばす
      end
    end

    def destroy
      @post = Post.find(params[:id]) #IDで投稿を取得
      @post.destroy
      redirect_to posts_path
    end

  end

  private

  #関数としての処理をまとめておく！
  def post_params
    params.require(:post).permit(:title, :body)
    # requireの引数をkeyに持つ値だけが取得できて、permitの引数のものだけをフィルターしてくれる！
  end
end
