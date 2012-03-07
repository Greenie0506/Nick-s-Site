class Photo

  def self.get_photos
    FlickRaw.api_key="2ed97e1dc0e147f32a47f5f5d781a6eb"
    FlickRaw.shared_secret="8db39cd0f8566a4c"
    all_photos = flickr.people.getPublicPhotos(:user_id => "65761480@N04")
    photos_url = []
    all_photos.each do |photo|
      photo_info = flickr.photos.getInfo(:photo_id => photo.id)
      url = "http://farm#{photo_info.farm}.static.flickr.com/#{photo_info.server}/#{photo.id}_#{photo_info.secret}_m.jpg"
      photos_url << url
    end
    return photos_url
  end

end
