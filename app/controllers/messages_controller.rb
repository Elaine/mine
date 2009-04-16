class MessagesController < ApplicationController
  before_filter :login_required, :only => [:new, :destroy, :renew]
  layout 'space'
  def index
    @user = User.find(params[:user_id])
    @space = @user.space
    @recipient_messages = Message.find_all_by_recipient_id(@user, :conditions => ["trashed = ? AND manager = ?", false, false] ,:order => 'created_at desc').paginate :page => params[:page], :per_page => 10
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
    @space = @user.space
    @recipient_messages = Message.find_all_by_recipient_id(@user)
    @recipient = User.find(params[:user_id])
  end

  def create
    @message = Message.create(:sender_id => logged_in_user.id,
                              :recipient_id => params[:recipient_id],
                              :title => params[:message][:title],
                              :content => params[:message][:content])
    if @message
      redirect_to user_messages_path(:user_id => logged_in_user.id)
    end
  end

  def reply
    @user = User.find(params[:user_id])
    @space = @user.space
    @current_message = Message.find(params[:id])
    @recipient = @current_message.sender
    @recipient_messages = Message.find_all_by_recipient_id(params[:user_id])
    @user = User.find(logged_in_user)
    @message = Message.new()
  end

  def renew
    @user = User.find(logged_in_user)
    @space = @user.space
    @recipient_messages = Message.find_all_by_recipient_id(params[:user_id])
    @oldmessage = Message.find(params[:id])
    @message = Message.create(:parent_id    => @oldmessage.id,
                              :title      => @oldmessage.title,
                              :content => params[:message][:content],
                              :sender_id       => @user.id,
                              :recipient_id    => @oldmessage.sender_id)
   redirect_to user_messages_path(:user_id => @user)
  end

  def message_to
    @user = User.find(logged_in_user)
    @space = @user.space
    @recipient_messages = Message.find_all_by_recipient_id(@user)
    @send_messages = Message.find_all_by_sender_id(params[:sender_id],:conditions => ["trashed = ? AND manager = ?", false, false ]).paginate :page => params[:page], :per_page => 10
  end

  def trashbox
    @recipient_messages = Message.find_all_by_recipient_id(@user)
    @user = User.find(params[:user_id])
    @space = @user.space
    @trashboxmessages = Message.find(:all, :conditions => [ "(recipient_id = :user) AND (trashed = true )", {:user => @user}]).paginate :page => params[:page], :per_page => 10
  end

  def message_delete
    @message = Message.find(params[:id])
    @message.update_attributes(:trashed => true)
    redirect_to user_messages_path(:user_id => @message.recipient)
   # redirect_to trashbox_user_messages_path(:user_id => @message.recipient)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to user_messages_path(:user_id => logged_in_user)
  end
end
