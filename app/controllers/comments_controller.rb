class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id]) #投稿の特定
    @comment = @post.comments.find(params[:id]) #投稿に紐づいたコメントの特定
    @comment.destroy #コメントの削除
    redirect_to post_path(@post) #投稿の詳細画面にリダイレクト
  end

  private
  # ストロングパラメータの設定
  def comment_params
    params.require(:comment).permit(:body)
    # httpリクエストの中のパラメータのうち:commentキーを持っていて、且つその中でも:bodyキーを持っているものを取ってくる
  end
end
