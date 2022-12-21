class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    if Post.all.count < 15
      GoogleNews.save_posts_from_google
    end

    @posts = Post.order(:rank).reverse.first(15)
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @user = current_user
    @users = User.all
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
		@user = current_user
		@users = User.all

    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: "Post was successfully created." }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: "Post was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def like
    @post = Post.all.find(params[:id])
    if(@post.liked?(current_user))
      @like = Like.find_by user_id:current_user.id, post_id:@post.id
      @like.destroy
      @post.rank -= 1
      @post.save
    else
      Like.create(user_id: current_user.id, post_id: @post.id)
      @post.rank += 1
      @post.save
      if(@post.disliked?(current_user))
        @dislike = Dislike.find_by user_id:current_user.id, post_id:@post.id
        @dislike.destroy
        @post.rank += 1
        @post.save
      end
    end
    #respond_to do |format|
    #  format.html { redirect_to posts_url}
    #  format.json { head :no_content }
    #end
    
  end
  def dislike
    @post = Post.all.find(params[:id])
    if(@post.disliked?(current_user))
      @dislike = Dislike.find_by user_id:current_user.id, post_id:@post.id
      @dislike.destroy
      @post.rank += 1
      @post.save
    else
      Dislike.create(user_id: current_user.id, post_id: @post.id)
      @post.rank -= 1
      @post.save
      if(@post.liked?(current_user))
        @like = Like.find_by user_id:current_user.id, post_id:@post.id
        @like.destroy
        @post.rank -= 1
        @post.save
      end
    end
    #respond_to do |format|
    #  format.html { redirect_to posts_url}
    #  format.json { head :no_content }
    #end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :category, :body, :image, :user_id)
    end
end
