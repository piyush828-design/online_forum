class AdminUser < ApplicationRecord
	devise :database_authenticatable,:recoverable, :rememberable, :validatable

	ROLES = %w{super_admin admin}

  def super_admin?
    role == "super_admin"
  end

  def admin?
    role == "admin"
  end
end
