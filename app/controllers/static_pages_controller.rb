class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
      # @posts = Post.all.paginate page: params[:page]
      # @post_active = @posts.where(status: true).paginate page: params[:page]
      @feed_items = current_user.feed.paginate page: params[:page]
      @feed_items_active = @feed_items.where(status: true).paginate page: params[:page]
    end
  end

  def active
    post = Post.find params[:post_id]
    post.update(status: true)
    redirect_to root_path
    flash[:success] = "Active Success!"
  end
end
