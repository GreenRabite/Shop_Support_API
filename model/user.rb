require 'pg'
require 'byebug'

class User
  attr_reader :id, :emailAddress

  def initialize(emailAddress)
    @emailAddress = emailAddress
  end

  def save
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    conn.prepare('saveUser', 'INSERT INTO users (id, emailAddress) VALUES ($1, $2)')
    conn.exec_prepared('saveUser', [3, self.emailAddress])
  end

  def self.find_by_email(emailAddress)
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    res = conn.exec_params('SELECT * FROM users WHERE emailAddress=$1', [emailAddress])
    debugger
    res.empty? ? nil : self.new(res[0])
  end

  def numLicenseKeysSent

  end

end
