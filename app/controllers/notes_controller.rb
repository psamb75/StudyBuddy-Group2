class NotesController < ApplicationController
    def index
        @course = Course.find(params[:course_id])
        @notes = @course.notes
    end

    def new
        @course = Course.find(params[:course_id])
    end

    def create
        course = Course.find(params[:course_id])
        notes_params_tmp = notes_params
        notes_params_tmp[:course_id] = course.id
        notes_params_tmp[:user_name] = current_user.name
        notes_params_tmp[:timeline] = Time.now


        @note = Note.new(notes_params_tmp)

        @note.save
        redirect_to :action => "show", :id => @note
    end

    def show
        @note = Note.find(params[:id])
    end

    private
        def notes_params
            params.require(:note).permit(:title, :location, :tag)
        end
  end
  