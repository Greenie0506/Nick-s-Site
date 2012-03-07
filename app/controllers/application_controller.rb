class ApplicationController < ActionController::Base
  require 'rubygems'
  require 'flickraw'
  protect_from_forgery

  def index
    #foursquare_api
    @checkin = Checkin.get_checkins


    #twitter_api
    @tweets = Tweet.get_tweets
    @profile_picture = "http://api.twitter.com/1/users/profile_image/nickpgreenfield"

    #blog
    @post = Post.all

    #date
    @time = Time.now.strftime("%A, %B %d, %Y")

    #mailer
    # @support = Support.new(:id => 1)

    #flick_api
    @photos = Photo.get_photos
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
end

