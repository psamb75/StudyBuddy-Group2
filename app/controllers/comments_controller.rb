class CommentsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]
  
  def new
    @note = Note.find(params[:note_id])
    @course = Course.find(params[:course_id])
    @ancestry = params[:ancestry]
    @ind = params[:ind]
    puts :ind
  end

  def create
    @note = Note.find(params[:note_id])
    comments_params_temp = comments_params
    comments_params_temp[:note_id] = @note.id
    comments_params_temp[:user_id] = current_user.id
    
    @comment = Comment.new(comments_params_temp)

        if @comment.save
          redirect_to course_note_path(@note.course,@comment.note)
        else
            flash[:error] = @comment.errors.full_messages
            redirect_to :action => "new", :id => @comment
        end
  end

  def index
  end

  def show
  end

  def destroy
  end

  private
        def comments_params
            params.require(:comment).permit(:text, :ancestry, :ind)
        end
end
