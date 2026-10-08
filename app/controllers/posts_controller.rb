class PostsController < ApplicationController
  def index
  end
  def new
  end
  def create
  end
  private
    def post_params
      params.expect(post: [ :title, :body, :img_url, :source_url, :user_id ])
    end
end
