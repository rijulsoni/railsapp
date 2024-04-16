class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id]) # This line seems to be for debugging purposes, you may remove it if not needed
  end

  def new
    @post = Post.new
  end


  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to posts_path() # Redirect to the newly created post's show page
    else
      render :new # Render the new template again if there are validation errors
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path() # Redirect to the newly created post's show page
    else
      render :edit # Render the new template again if there are validation errors
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path()
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
