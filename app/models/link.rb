class Link < ActiveRecord::Base
  require 'uri'

  validates :info, length: { minimum: 15 }
  validates :link, presence: true
  validate :valid_url

  def valid_url
    !!URI.parse(:link)
  rescue URI::InvalidURIError
    false
  end

end
