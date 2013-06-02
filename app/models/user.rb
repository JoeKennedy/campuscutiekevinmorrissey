class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :is_admin,
                  :password, :password_confirmation, :remember_me

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :first_name, 
            :uniqueness => { :scope => :last_name,
                             :message => "and last name already in use!" }

  def name
    name = self.first_name + ' ' + self.last_name
  end
end
