class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_post, only: %i[ show edit update destroy ]
  def favorite
    @post = Post.all.find(params[:id])
    @favorite = Favorite.find_by user_id:current_user.id, post_id:@post.id
    if @favorite == nil
      Favorite.create(user_id: current_user.id, post_id: @post.id)
    else 
      @favorite.destroy
    end
  end
  def show_favorite
    favorited_ids = "SELECT post_id FROM favorites WHERE  user_id = :user_id"
    @pagy, @posts = pagy_countless(Post.where("id IN (#{favorited_ids})", user_id: params[:id]), items: 5)
    @comment = Comment.new
  end
  def maps
    @current_view = 'posts/maps'
    if(params[:title]!=nil)
      @title = params[:title]
      #@posts = Post.where("body LIKE ?", "%#{@title}%")
      @posts = Post.joins(:user).where("body LIKE ?", "%#{params[:title]}%")
                  .select("posts.*, users.name as author_name")
      respond_to do |format|
        format.json {render :json => @posts }
      end
    end
    @comment = Comment.new
  end
  
  def feed
    @current_view = 'posts/feed'
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    @pagy, @posts = pagy_countless(Post.where("user_id IN (#{following_ids})"), items: 5)
    @comment = Comment.new
    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
    if params[:keyword].present?
      @pagy, @posts = pagy_countless(current_user.feed.where("title LIKE ? OR body LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%").order(rank: :desc), items: 5)
    elsif params[:category].present? 
      @pagy, @posts = pagy_countless(current_user.feed.where(category: params[:category]).order(rank: :desc), items: 5)
    else
      @pagy, @posts = pagy_countless(current_user.feed.order(rank: :desc), items: 5)
    end
  end
  # GET /posts or /posts.json
  def index
    if (Post.all.count < 15 && User.all.count != 0)
      GoogleNews.save_posts_from_google
    end
    @current_view = 'posts/index'   
    if params[:keyword].present?
      @pagy, @posts = pagy_countless(Post.where("title LIKE ? OR body LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%").order(rank: :desc), items: 5)
    elsif params[:category].present? 
      @pagy, @posts = pagy_countless(Post.where(category: params[:category]).order(rank: :desc), items: 5)
    else
      @pagy, @posts = pagy_countless(Post.order(rank: :desc), items: 5)
    end

    #query -> Post.order(:rank).reverse
    @comment = Comment.new
    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
    
    #ricerca per categoria
    

  end

  # GET /posts/new
  def new
    @user = current_user
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts/create or /posts.json
  def create
		@user = current_user
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_path(current_user), notice: "Post was successfully created." }
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
        format.html { redirect_to user_path(current_user), notice: "Post was successfully updated." }
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
      format.html { redirect_to user_path(current_user), notice: "Post was successfully destroyed." }
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
