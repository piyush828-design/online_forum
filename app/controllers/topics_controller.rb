class TopicsController < ApplicationController
	#load_and_authorize_resource

	def index
		@topic = Topic.find_by(id: params[:id])
		if current_user.topics.count == 0
			flash.now[:notice] = "You have not created any post! Create one"
			render 'new'
		end
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = current_user.topics.build(topic_params)
		@topic.approved = false
		if @topic.save
			redirect_to @topic
		else
			flash.now[:error] = ('one of the field is missing')
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@topic = Topic.new
	end
	# def show
	# 	@topic = current_user.topics.find(params[:id])
	# end

	def edit
    @topic = Topic.find_by(id: params[:id])
  end

	def update
		@topic = Topic.find_by(id: params[:id])

		if @topic.update(topic_params)
			redirect_to @topic
		else
			flash.now[:error] = ('one of the field is missing')
			render 'edit'
		end
	end

	def destroy
  	@topic = Topic.find(params[:id])
  	@topic.destroy
  	redirect_to root_path, status: :see_other
	end

	private
	
	def topic_params
		params.require(:topic).permit(:category_id,:title,:content,:topic_image).merge(user_id: current_user.id)
	end
end
  
 