ActiveAdmin.register Topic do

  batch_action :approve do |ids|
    batch_action_collection.find(ids).each do |post|
      post.update(approved:true)
    end
    redirect_to collection_path, alert: "The posts have been approved."
  end

  batch_action :disapprove do |ids|
    batch_action_collection.find(ids).each do |post|
      post.update(approved:false)
    end
    redirect_to collection_path, alert: "The posts have been disapproved."
  end
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :user_id, :category, :approved
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :user_id, :category, :approved]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :content, :approved, :user_id

  action_item :approve, only: :show do
    link_to 'Approve', approve_admin_topic_path(topic), method: :put if !topic.approved
  end

  member_action :approve, method: :put do
    topic = Topic.find(params[:id])
    topic.update(approved: true)
    redirect_to admin_topic_path(topic), notice: 'Post approved successfully!'
  end

  

  # Rest of your Active Admin configuration...
  
end
