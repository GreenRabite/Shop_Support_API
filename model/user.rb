require 'pg'
require 'byebug'

class User
  attr_accessor :id
  attr_reader :emailAddress

  def initialize(emailAddress)
    @id
    @emailAddress = emailAddress
  end

  def save
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    res = conn.exec_params('SELECT max(id) from users')
    id = res.max['max'].to_i + 1
    conn.prepare('saveUser', 'INSERT INTO users (id, emailAddress) VALUES ($1, $2)')
    conn.exec_prepared('saveUser', [id, self.emailAddress])
  end

  def self.all
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    res = conn.exec_params('SELECT * FROM users')
    result = []
    res.each do |row|
      user = User.new(row['emailaddress'])
      user.id = row['id']
      result << user
    end
    result
  end

  def self.find_by_email(emailAddress)
    conn = PG::Connection.open(:dbname=>'shop_support_api')
    res = conn.exec_params('SELECT * FROM users WHERE emailAddress=$1', [emailAddress])
    user = self.new(res.getvalue(0,1))
    user.id = res.getvalue(0,0)
    user
  end

  def numLicenseKeysSenta

  end

end
