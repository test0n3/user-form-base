class User < ApplicationRecord
  validates :first_name, :last_name, :username, :email, :email_confirmation, :password, :password_confirmation, presence: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 60 }
  # validates :last_name, length: { minimum: 2, maximum: 60 }
  validates :username, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :email, confirmation: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  # validates :email_confirmation, presence: true
  validates :password, length: { minimum: 8 }, confirmation: true, format: { with: /\A(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?!.*\s).{8,20}\Z/}
  # validates :password_confirmation, presence: true
  validates :password_hint, length: { maximum: 100 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
