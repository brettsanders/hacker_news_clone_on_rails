class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(post_id: params[:post_id], body: params[:comment][:body])
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render post_path(params[:post_id])
    end
  end
end


# class PostsController < ApplicationController
#   def new
#     @post = Post.new
#   end

#   def create
#     @post = current_user.posts.new(params[:post])
#     if @post.save
#       flash[:notice] = "Created new post"
#       redirect_to homepage_path
#     else
#       render 'new'
#     end
#   end

#   def show
#     @post = Post.find(params[:id])
#   end

#   def edit
#     @post = Post.find(params[:id])
#   end

#   def update
#     @post = Post.find(params[:id])
#     if @post.update_attributes(params[:post])
#       redirect_to @post
#     else
#       render 'edit'
#     end
#   end

#   def destroy
#     Post.find(params[:id]).destroy
#     redirect_to homepage_path
#   end
# end
