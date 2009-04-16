class AlbumsController < ApplicationController
  before_filter :login_required, :except => [:index]
  layout 'space'
  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums.paginate :page => params[:page],:per_page => 6
  end

  def new
    @user = User.find(params[:user_id])
    @album = Album.new
  end

  def create
    @user = User.find(params[:user_id])
    @album = @user.albums.new(params[:album])

    if @album.save
      @user.tag(@album, :with => params[:tags][:name], :on => :tags)
      @user.update_attribute(:score, @user.score + 1)
      if @user.score > @user.grade.score
        @user.update_attribute(:grade_id, @user.grade_id + 1)
      end
      flash[:notice] = '相册创建成功!'
      redirect_to user_albums_path
    else
      render :action => "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to user_album_photos_path(:album_id => @album)
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to space_albums_path
  end
end
