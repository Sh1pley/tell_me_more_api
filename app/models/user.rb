class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  reverse_geocoded_by :latitude, :longitude

  def self.add_coordinates(user, request_location)
    Rails.cache.fetch("#{user.id}-#{user.updated_at}/location", expires_in: 1.hours) do
      request_location
    end
  end
end
