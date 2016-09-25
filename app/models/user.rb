class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, uniqueness: {
    scope: :last_name, message: "and last name already in use!"
  }

  def name
    name = self.first_name + ' ' + self.last_name
  end
end
