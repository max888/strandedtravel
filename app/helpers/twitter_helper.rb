module TwitterHelper


  def self.get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = "5rdaJ4nM1LXlyQuENp1mEQ"
      config.consumer_secret     = "U5VrjAMUYFd0ZcKQUzEVUVQxPus468gar9WTQncbjsE"
      config.access_token        = "814910718-49mXFfhTpZ5n0i76htwG4ll8fMdKb0D5Utc537hr"
      config.access_token_secret = "LIsbmwT92evrZnVuAWDDKExOkuLVFYELxJCBxZ4snStTP"
    end
  end


end