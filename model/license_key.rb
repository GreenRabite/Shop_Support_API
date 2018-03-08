class License_Key

  attr_reader :userId, :license_key

  def initilize(userId)
    @userId = userId
  end

  def self.find_by_userId(userId)
    
  end

end
