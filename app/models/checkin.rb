class Checkin

  def self.get_checkins
    http_client = HTTPClient.new
    fsq_url = "https://api.foursquare.com/v2/users/5654950/checkins?oauth_token=2CFB3EZW2QSUVQ5LOVRTMKHKKZEIJVT3M5H4KBHOG55TRZV1&v=20120219"
    data = http_client.get_content(fsq_url)
    data = JSON.parse(data)
    checkins_name = data['response']['checkins']['items'].map{|i| i['venue']}.map{|ven| ven['name']}.first
    checkins_address = data['response']['checkins']['items'].map{|i| i['venue']}.map{|ven| ven['location']}.map{|loc| loc['address']}.first
    checkins_city = data['response']['checkins']['items'].map{|i| i['venue']}.map{|ven| ven['location']}.map{|loc| loc['city']}.first

    return [checkins_name, checkins_address, checkins_city]
  end

end
