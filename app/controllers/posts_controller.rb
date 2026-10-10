class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @posts = Post.includes(:user).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render new:, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.expect(post: [ :title, :body, :img_url, :source_url ])
    end
end
