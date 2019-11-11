class TutorsController < ApplicationController
    def index
        course = Course.find(params[:course_id])
        @tutors = course.tutors
    end

    def show
        @tutor = Tutor.find(params[:id])
    end

    def create
        course = Course.find(params[:course_id])
        tutors_params_tmp = tutors_params
        tutors_params_tmp[:user_name] = current_user.name
        tutors_params_tmp[:course_code] = course.course_code
        tutors_params_tmp[:user_id] = current_user.id
        tutors_params_tmp[:course_id] = course.id

        @tutor = Tutor.new(tutors_params_tmp)
        @tutor.save

        redirect_to :action => "show", :id => params[:id]
    end

    def hire
        course = Course.find(params[:course_id])
        tutor = Tutor.find(params[:tutor_id])
        @tutoringSession = TutoringSession.new(tutor_name: tutor.user_name, student_name: current_user.name, course_code: course.course_code, user_id:current_user.id, tutor_id: tutor.id)

        @tutoringSession.save
        redirect_to :controller => "dashboard", :action => "index"
    end

    private
    def tutors_params
      params.require(:tutor).permit(:description, :rate)
    end
end
