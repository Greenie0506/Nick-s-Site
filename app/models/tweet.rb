class Tweet

  def self.get_tweets
    search = Twitter::Search.new
    recent_tweets = search.from('nickpgreenfield').result_type("recent")
    profile_picture = "http://api.twitter.com/1/users/profile_image/nickpgreenfield"
    handle_tweets = recent_tweets.per_page(3).fetch
    return handle_tweets
  end

end
