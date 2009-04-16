class PhotosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  layout 'space'
  def index
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @photos = @album.photos.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 8
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new
  end

  def create
    @album = Album.find(params[:album_id])
    @user = User.find(params[:user_id])
    @photo = @album.photos.new(params[:photo])
    @photo.user = @user
    if @photo.save
      @user.tag(@photo, :with => params[:tags][:name], :on => :tags)
      @user.update_attribute(:score, @user.score + 1)
      if @user.score > @user.grade.score
        @user.update_attribute(:grade_id, @user.grade_id + 1)
      end
      redirect_to user_album_photos_path(:album_id => @album)
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @user= @photo.user
    unless logged_in_user == @photo.user
      @photo.update_attributes(:views_count => @photo.views_count + 1)
    end
    @photos = Photo.find_by_sql ["SELECT * FROM photos where id != ? AND album_id = ?", @photo.id, @photo.album.id]
  end

  def edit
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to user_album_photo_path(:id => @photo)
    end
  end

  def destroy
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.destroy
    redirect_to user_album_photos_path(:album_id => @album)
  end

  def set_avatar
    @photo = Photo.find(params[:id])
    @user = User.find(params[:user_id])
    @old_avatar = @user.photos.select(&:avatar?)

    if @photo.update_attributes(:avatar => true)
      @old_avatar.each { |p| p.update_attributes!(:avatar => false) }
      redirect_to space_path(:id => @photo.user)
    end
  end

  def set_primary
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
    @old_primary = @album.photos.select(&:primary?)

    if @photo.update_attributes(:primary => true)
      @old_primary.each { |p| p.update_attributes!(:primary => false) }
      redirect_to user_albums_path(:user_id => @album.user)
    end
  end
end
