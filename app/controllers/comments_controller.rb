class CommentsController < ApplicationController
	def create
		byebug
    	@topic = Topic.find(params[:topic_id])
    	@comment = @topic.comments.create(comment_params)

    	redirect_to topic_path(@topic)
    end
    
    private
    def comment_params
    	params.require(:comment).permit(:content)
    end
end
