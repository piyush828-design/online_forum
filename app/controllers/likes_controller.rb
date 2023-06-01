class LikesController < ApplicationController
	  
  def new
  	topic = Topic.find(params[:topic])
  	if topic.likes.where(user_id: current_user.id).exists?
  		like = topic.likes.find_by(user_id: current_user.id)
  		like.destroy
  	else
  		like = Like.create(user_id: current_user.id,topic_id:params[:topic])
  	end
		redirect_to root_path
  end
end
