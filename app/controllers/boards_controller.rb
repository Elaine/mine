class BoardsController < ApplicationController
  before_filter :login_required, :only => [:new]
  layout 'community'
  def index
    @categories = BoardCategory.find(:all, :conditions => {:category_type => 1})
    @boards = Board.find(:all, :conditions => ["board_category_id = ?", params[:category_id]], :order => 'created_at desc')
    @category = BoardCategory.find(params[:category_id])
    @board = Board.new
  end

  def create
    @board = logged_in_user.boards.new(params[:board])
    @category = BoardCategory.find(params[:category_id])
    @board.board_category = @category
    if @board.save
      redirect_to :action => 'index', :category_id => @category
    end
  end
end
