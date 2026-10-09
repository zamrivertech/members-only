class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    puts current_user.id
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render new:, status: :unprocessable_content
    end
  end

  private
    def post_params
      params.expect(post: [ :title, :body, :img_url, :source_url, :user_id ])
    end
end
