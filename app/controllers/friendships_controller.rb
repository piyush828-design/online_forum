class FriendshipsController < ApplicationController
  		
  def new
    #byebug
	  if current_user.friend_sender.where(receiver_id: params[:user_id]).exists?
      @friendship = current_user.friend_sender.find_by(receiver_id: params[:user_id])
      @friendship.destroy
    else
      @friendship = current_user.friend_sender.create(receiver_id: params[:user_id])
    end 
    redirect_to @friendship
	end

	def index
		@friendship = Friendship.where(receiver_id: params[:user_id],status: false)
	end

  def edit
    friendship = Friendship.find_by(sender_id:params[:user_id] ,receiver_id:current_user.id, status: false)
    friendship&.status = true
    if friendship&.save
      flash[:success] = 'Friend Request Accepted!'
    else
      flash[:danger] = 'Friend Request could not be accepted!'
    end
    redirect_to request.referrer
  end 

  def show
  	@friendship = Friendship.where(status:true)
  end

  def delete
  	friendship = Friendship.find_by(receiver_id:current_user.id,id:params[:friend_id], status: true)
    friendship&.status = false
    friendship.destroy
    redirect_to request.referrer
  end
end
