class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  end

  private
    def post_params
      params.expect(post: [ :title, :body, :img_url, :source_url, :user_id ])
    end
end
