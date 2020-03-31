class PostsController < ApplicationController
  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = "Wait for actived!"
      redirect_to root_url
    else
      flash.now[:danger] = "Create Micropost False"
      @feed_items = []
      render "static_pages/home"
    end
  end


  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:picture, :content, :describe, :title)
  end

end
