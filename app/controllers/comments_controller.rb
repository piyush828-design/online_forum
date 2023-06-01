class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic  = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
  end

	def create
    @topic  = Topic.find(params[:topic_id])
  	@comment = @topic.comments.new(comment_params)
  	@comment.save
    if @comment.save
      redirect_to root_path
  	end
	end

  def show
    @topic = Topic.find(params[:topic_id])
  end

	private

	def comment_params
  	params.require(:comment).permit(:content,:topic_id,:user_id).merge(user_id: current_user.id)
  end
end

 