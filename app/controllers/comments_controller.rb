class CommentsController < ApplicationController
  before_action :load_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  
  def index
    @comments = @post.comments
  end

  
  def show
    # @comment = @post.comments.build
  end

  
  def new
    @comment = @post.comments.build
  end

  def edit
    # @comment = @post.comments.find(params[:id])
  end

  
    def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  
  def update
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body,:email)
    end

    def load_post
      @post = Post.find(params[:post_id])
    end
end
