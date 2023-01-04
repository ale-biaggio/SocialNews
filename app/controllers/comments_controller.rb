class CommentsController < ApplicationController
  before_action :authenticate_user!

  # POST /comments or /comments.json
  def create
    id_post = params[:post_id]
		@post = Post.find(id_post)
		id_user = params[:comment][:user_id]
		@user = User.find(id_user)
		@comment = Comment.new(comment_params)
		@comment.post = @post
    if @comment.save
			redirect_to posts_path, notice: "A review has from #{@user.name} been successfully added to #{@post.title}." 
		else
			render :new, status: :unprocessable_entity 
		end

  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.update(visible: false)
    @comment.save

    respond_to do |format|
      format.turbo_stream { head :no_content }
      format.html { redirect_to posts_path, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
