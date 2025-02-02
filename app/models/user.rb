class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true


  def full_name
    "#{first_name} #{last_name}".strip
  end
end
