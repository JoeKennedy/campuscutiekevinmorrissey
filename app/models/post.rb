class Post < ActiveRecord::Base
  attr_accessible :image, :message, :category

  validates :message, :presence => true
  #validates :email, 
  #          :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
  #                       :message => "Not a valid email address" }
  validates :is_approved, :exclusion => { :in => %w(1) }, :on => :create
  validates :category, :inclusion => { :in => [ 'Anecdote', 'High Praise',
                                                'Birthday Wish' ],
                                       :message => 'Select a type please' }

  has_many :comments, :dependent => :destroy
  belongs_to :user
end
