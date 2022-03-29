class PostsController < ApplicationController
  def create
    @content = params[:content]
    p = post_params
    user = User.find(p[:id])

    if (p[:body] == "")
      flash[:alert] = "空白のままコメントすることはできません"
      render "movies/show"
    else
      if user.posts.create(
        body: p[:body],submitter: current_user.id,review: p[:review],
        image: p[:image], poster_path: p[:poster_path])
        flash[:notice] = "コメントが投稿されました。"
      else
        flash[:alert] = "コメントの投稿に失敗しました。"
      end
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to root_path
  end

  protected

  def post_params
    params.require(:post).permit(:body, :id, :review, :image, :poster_path)
  end
end
