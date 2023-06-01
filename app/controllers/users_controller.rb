class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		#@user = User.find_by(name: params[:name])
		@user = User.where("name LIKE ?",params[:name] + "%")
	end
end
