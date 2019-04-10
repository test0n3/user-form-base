class User < ApplicationRecord
  validates :first_name, :last_name, :username, :email, :email_confirmation, :password, :password_confirmation, presence: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 60 }
  validates :username, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :email, confirmation: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, length: { minimum: 8 }, confirmation: true, format: { with: /\A(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?!.*\s).{8,20}\Z/}
  validates :password_hint, length: { maximum: 100 }

  before_create :correct_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def correct_name
    self.first_name = self.check_name(first_name)
    self.last_name = self.check_name(last_name)
  end

  def check_name(my_data)
    temp = my_data.downcase.split(' ')
    temp.each_with_index do |a|
      if a.length >= 3
        if a[0,1] != "d"
          a.capitalize!
        end
      end
    end
    temp.join(' ')
  end
end
