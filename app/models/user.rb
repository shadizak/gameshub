class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments

  def full_name
    "#{first_name} #{last_name}"
  end

  def date_format
    last_sign_in_at.strftime("%d/%m/%Y")
  end
  def full_date_format
    last_sign_in_at.strftime("%d/%m/%Y %I:%M%p")
  end
end
