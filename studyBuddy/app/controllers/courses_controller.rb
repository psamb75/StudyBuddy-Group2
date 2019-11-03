class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
    end

    def new
    end

    def create
        @course = Course.new(course_params)

        @course.save
        redirect_to @course
    end

    def add
        course_id = params[:course_id]
        course = Course.find(course_id)
        me = current_user
        @enrollment = Enrolment.new(user_name: me.name, course_name: course.course_name, user_id: me.id, course_id: course_id)

        @enrollment.save
        redirect_to dashboard_path
    end

    private
        def course_params
            params.require(:course).permit(:course_code, :course_name)
        end
end
