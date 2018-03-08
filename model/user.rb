require 'pg'
require 'byebug'

class User
  attr_reader :id, :emailAddress

  def initialize(emailAddress)
    @emailAddress = emailAddress
  end

  def save

  end

  def self.find_by_email(emailAddress)
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    debugger
    res = conn.exec_params('')
  end

  def numLicenseKeysSent

  end

end
