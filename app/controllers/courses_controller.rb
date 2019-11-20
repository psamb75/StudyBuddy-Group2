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

        if @course.save
            flash[:notice] = "Successfully add a new course !"
            redirect_to @course
        else
            if course_params[:course_code] == ""
                flash[:error] = "Error: The course code can not be empty"
            elsif course_params[:course_name] == ""
                flash[:error] = "Error: The course name can not be empty"
            else
                flash[:error] = "Error: The course has already ben added"
            end
            render 'new'
        end
    end

    def add
        course_id = params[:course_id]
        course = Course.find(course_id)
        me = current_user
        @enrollment = Enrolment.new(user_name: me.name, course_name: course.course_name, user_id: me.id, course_id: course_id)

        @enrollment.save
        redirect_to dashboard_path
    end

    def destroy
        course_id = params[:id]
        enrolment = Enrolment.find_by(user_id: current_user.id, course_id: course_id)
        enrolment.destroy

        redirect_to dashboard_path
    end

    private
        def course_params
            params.require(:course).permit(:course_code, :course_name)
        end
end

