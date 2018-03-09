require 'securerandom'
require 'pg'
require 'byebug'

class License_Key

  attr_reader :userId, :license_key

  def initialize(userId)
    @userId = userId
    @license_key = SecureRandom.urlsafe_base64
  end

  def save

  end

  def self.find_by_userId(userId)

  end

end
