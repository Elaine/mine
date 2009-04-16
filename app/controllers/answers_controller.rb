class AnswersController < ApplicationController
  before_filter :login_required
  def new
    @ask = Ask.find(params[:ask_id])
    @answer = Answer.new
  end

  def create
    @ask = Ask.find(params[:ask_id])
    @answer = @ask.answers.new(params[:answer])
    @answer.user = logged_in_user
    @answer.save
    redirect_to ask_path(:id => @ask.id)
  end

  def edit
    @ask = Ask.find(params[:ask_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to ask_path(:id => @answer.ask.id)
    else
      render :action => 'edit'
    end
  end

  def set_answer
    @answer = Answer.find(params[:id])
    @answer.update_attributes(:status => true)
    @ask = Ask.find(params[:ask_id])
    @ask.update_attributes(:solved => true)
    @answer.user.update_attribute(:score, @answer.user.score + @answer.score)
    if @answer.user.score > @answer.user.grade.score
      @answer.user.update_attribute(:grade_id, @answer.user.grade_id + 1)
    end
    redirect_to ask_path(:id => @ask)
  end
end
