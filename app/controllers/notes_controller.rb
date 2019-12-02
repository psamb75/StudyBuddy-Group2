class NotesController < ApplicationController
    def index
        @course = Course.find(params[:course_id])
        if params[:search].blank?
            @notes = @course.notes
        else
            @notes = Note.search(params[:search])
        end
    end

    def new
        @course = Course.find(params[:course_id])
    end

    def edit
        @note = Note.find(params[:id])
        @course = Course.find(params[:course_id])
    end

    def create
        course = Course.find(params[:course_id])
        notes_params_tmp = notes_params
        notes_params_tmp[:course_id] = course.id
        notes_params_tmp[:user_name] = current_user.name
        notes_params_tmp[:timeline] = Time.now
        notes_params_tmp[:user_id] = current_user.id


        @note = Note.new(notes_params_tmp)

        if @note.save
            redirect_to :action => "show", :id => @note
        else
            flash[:error] = @note.errors.full_messages
            redirect_to :action => "new", :id => @note
        end
    end

    def update
        @note = Note.find(params[:id])

        if @note.update(notes_params)
            redirect_to :action => "show", :id => @note
        else
            render 'edit'
        end
    end

    def destroy
        @course = Course.find(params[:course_id])
        @note = Note.find(params[:id])
        note_id = params[:id]

        @comment = Comment.where(note_id: note_id)
        @comment.where(note_id: note_id).destroy_all

        @note.destroy

        redirect_to :action => "index"
    end

    def show
        @note = Note.find(params[:id])
        @comments = @note.comments
    end

    def deleteComment
        @note = Note.find(params[:note_id])
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
        redirect_to :action => "show", :id => @note
    end

    private
        def notes_params
            params.require(:note).permit(:title, :location, :tag, :file)
        end
  end
  