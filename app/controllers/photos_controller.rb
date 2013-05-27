# -*- encoding : utf-8 -*-
class PhotosController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.js
    end
  end

  # POST /photos
  # POST /photos.xml
  def create
    params[:photo][:photo] = params[:photo][:photo][0] if params[:photo][:photo].is_a?(Array)

    @photo = Photo.new
    @photo.photo = params[:photo][:photo]
    @photo.save
      
    render nothing: true
  end
end