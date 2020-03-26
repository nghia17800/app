class PostsController < ApplicationController
  def create
    @post = current_user.post.build post_params
    if @post.save
      flash[:success] = "Micropost created!"
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

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def post_params
    params.require(:post).permit(:picture, :content, :describe, :title)
  end

end
