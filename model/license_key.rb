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
    id
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    conn.prepare('saveLicenseKey', 'INSERT INTO users (id, user_id, license_key) VALUES ($1, $2, $3)')
    conn.exec_prepared('saveLicenseKey', [id, self.userId, self.license_key])
  end

  def self.find_by_userId(userId)

  end

end
