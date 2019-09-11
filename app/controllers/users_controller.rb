class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_url, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'プロフィールを編集しました。'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    gon.data = []
    html = 0
    css = 0
    javascript = 0
    jquery = 0
    ruby = 0
    rails = 0
    php = 0
    java = 0
    go = 0
    python = 0
    swift = 0
    
    @posts.each do | post |
      html += post.html
      css += post.css
      javascript += post.javascript
      jquery += post.jquery
      ruby += post.ruby
      rails += post.rails
      php += post.php
      java += post.java
      go += post.go
      python += post.python
      swift += post.swift
    end
    gon.data.push(html, css, javascript, jquery, ruby, rails, php, java, go, python, swift)
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
