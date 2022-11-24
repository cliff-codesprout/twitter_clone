class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  validates :screenname, length: { maximum: 50 }

  def display_name
    if self.screenname.present?
      self.screenname
    else
      self.email
    end
  end
end
