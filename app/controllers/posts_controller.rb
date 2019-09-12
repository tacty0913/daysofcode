class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      redirect_to posts_url, notice: '勉強内容を投稿しました'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    ensure_correct_post
  end
  
  def update
    ensure_correct_post
    if @post.update(post_params)
      redirect_to posts_url, notice: "勉強内容を編集しました"
    else
      render :edit
    end
  end
  
  def destroy
    ensure_correct_post
    @post.destroy
    redirect_to user_url(@post.user_id), notice: '投稿を削除しました。'
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :html, :css, :javascript, :jquery, :ruby, :rails, :php, :java, :go, :python, :swift)
  end
  
  def ensure_correct_post
    @post = Post.find(params[:id])
    
    if @post.user_id != current_user.id
      redirect_to user_url, notice: '権限がありません'
    end
  end
end
