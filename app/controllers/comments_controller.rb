class CommentsController < ApplicationController
	
	def new
    	@topic = Topic.find(params[:topic_id])
    	@comment = @topic.comments.new
  	end

  	def create
    	@comment = @topic.comments.new(comment_params)
    	@comment.user_id = current_user.id
    	@comment.save
    	redirect_to @comment
  	end

  	def show
    	@topic = Topic.find(params[:topic_id])
  	end

  	private

  	def comment_params
    	params.require(:comment).permit(:content, :topic_id, :user_id).merge(user_id: current_user.id)
  	end

end

