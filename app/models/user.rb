class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :topics, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :friend_sender, class_name: 'Friendship', foreign_key: 'sender_id'
  has_many :friend_receiver, class_name: 'Friendship', foreign_key: 'receiver_id'
  has_many :friends, through: :friend_receiver, source: :sender
  after_create :send_welcome_send

  ROLES = %w{super_admin admin}

  def super_admin?
    role == "super_admin"
  end

  def admin?
    role == "admin"
  end

  def send_welcome_send
    UserMailer.welcome_mail(self).deliver_now
  end
end
