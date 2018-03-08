class User
  attr_reader :id, :emailAddress

  def initialize(emailAddress)
    @emailAddress = emailAddress
  end

  def self.find_by_email(emailAddress)
    
  end

  def numLicenseKeysSent

  end

end
