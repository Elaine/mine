class Admin::MessagesController < ApplicationController
  layout 'admin'
  def index
    @messages = Message.find(:all, :conditions => ["manager = ? AND  recipient_id = ?", true, logged_in_admin.id]).paginate :page => params[:page], :per_page => 10
  end

  def new
    @message = Message.new
    @recipient = Admin.find_by_name(params[:admin])
    @user = User.find(logged_in_user)
  end

  def create
    @message = Message.new(:sender_id => logged_in_user.id,
                           :recipient_id => params[:recipient_id],
                           :title => params[:message][:title],
                           :content => params[:message][:content],
                           :manager => true)
    if @message.save
      redirect_to user_messages_path(:user_id => logged_in_user.id)
    end
  end

  def reply
    @admin = Admin.find_by_name("admin")
    @current_message = Message.find(params[:id])
    @recipient = @current_message.sender
    @messages = Message.find(:all, :conditions => ["manager = ? AND recipient_id = ?", true, logged_in_admin]).paginate :page => params[:page], :per_page => 10
    @message = Message.new()
  end

  def renew
    @admin = Admin.find_by_name("admin")
    @oldmessage = Message.find(params[:id])
    @message = Message.create(:parent_id    => @oldmessage.id,
                              :title      => @oldmessage.title,
                              :content => params[:message][:content],
                              :sender_id       => @admin.id,
                              :recipient_id    => @oldmessage.sender_id)
    redirect_to admin_messages_path
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_messages_path(:user_id => logged_in_admin)
  end
end
