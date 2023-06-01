class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :topic_image
  has_many :likes,dependent: :destroy
  belongs_to :category
  validates :content, presence:true
  after_update :approve_mail , if: :approved_changed?
  #after_update :disapprove_mail, if: :approved_changed?

  def approved_changed?
    saved_change_to_approved? 
  end

  def approve_mail
    UserMailer.approve_mail(self.user[:email]).deliver
  end

  def disapprove_mail
    UserMailer.disapprove_mail(self.user[:email]).deliver
  end
end



