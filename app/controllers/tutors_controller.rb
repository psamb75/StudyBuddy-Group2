class TutorsController < ApplicationController
    before_action :authenticate_user!

    def index
        @course = Course.find(params[:course_id])
        @tutors = @course.tutors.select{ |s| s.completed == false }
    end

    def show
        @tutor = Tutor.find(params[:id])
        tutoring_sessions = TutoringSession.where(tutor_name: @tutor.user_name).select{ |t| t.completed == true }
        sum = 0
        @count = 0

        tutoring_sessions.each do |t|
            sum += t.rating
            @count += 1
        end

        if @count == 0
            @rating = 0
        else
            @rating = sum.to_f / @count
        end
    end

    def create
        course = Course.find(params[:course_id])
        tutors_params_tmp = tutors_params
        tutors_params_tmp[:user_name] = current_user.name
        tutors_params_tmp[:course_code] = course.course_code
        tutors_params_tmp[:user_id] = current_user.id
        tutors_params_tmp[:course_id] = course.id

        @tutor = Tutor.new(tutors_params_tmp)
        if @tutor.save
            flash[:notice] = "Successfully Become a Tutor"
            redirect_to :action => "show", :id => @tutor
        else
            flash.now[:error] = @tutor.errors.full_messages
            render 'new'
        end
    end

    def edit
        @tutor = Tutor.find(params[:id])
        @course = Course.find(params[:course_id])
    end

    def update
        @tutor = Tutor.find(params[:id])
 
        if @tutor.update(tutors_params)
            flash[:notice] = "Successfully Updated the Tutor info"
            redirect_to :action => "show", :id => @tutor
        else
            flash[:error] = @tutor.errors.full_messages
            render 'edit'
        end
    end

    def hire
        course = Course.find(params[:course_id])
        tutor = Tutor.find(params[:tutor_id])
        @tutoringSession = TutoringSession.new(tutor_name: tutor.user_name, student_name: current_user.name, course_code: course.course_code, user_id:current_user.id, tutor_id: tutor.id)
        charge_info = { :stripeEmail => params[:stripeEmail],
                        :stripeToken => params[:stripeToken],
                        :amount => tutor.hours * tutor.rate * 100,
                        :description => "You have paid user #{tutor.user_name} for tutoring service in #{course.course_name}" }

        if @tutoringSession.save
            flash[:notice] = "Successfully paid for the Tutoring service"
            redirect_to :controller => "charges", :action => "checkout", :charge_info => charge_info
        else
            flash[:error] = @tutoring_session.errors.full_messages
            redirect_to :action => "show", :id => @tutor
        end
    end

    def complete
        @tutor = Tutor.find(params[:id])
        @tutoring_session = TutoringSession.find_by(tutor_id: params[:id])
        rating = params[:rating]

        if @tutoring_session.update(rating: rating, completed: true) && @tutor.update(completed: true)
            flash[:notice] = "Successfully ended the Tutoring session"
        else
            flash[:error] = @tutoring_session.errors.full_messages
        end

        redirect_to dashboard_path
    end

    private
    def tutors_params
      params.require(:tutor).permit(:description, :rate, :hours, :date)
    end
end
