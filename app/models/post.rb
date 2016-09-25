class Post < ActiveRecord::Base
  validates :message, presence: true
  validates :is_approved, exclusion: { in: %w(1) }, on: :create
  validates :category, inclusion: {
    in: ['Anecdote', 'High Praise', 'Birthday Wish'],
    message: 'Select a type please'
  }

  has_many :comments, dependent: :destroy
  belongs_to :user
end
