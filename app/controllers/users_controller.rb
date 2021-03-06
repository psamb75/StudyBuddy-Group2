class UsersController < ApplicationController
    before_action :authenticate_user!

    #do we need auth part for it?
    def show
        @user = User.find(params[:id])
        @my_courses = @user.courses
        my_tutoring_as_tutor = @user.tutors
        my_tutoring_as_student = @user.tutoring_sessions
        @my_active_tutoring_as_student = my_tutoring_as_student.select{ |s| s.completed == false }
        @my_past_tutoring_as_student = my_tutoring_as_student.select{ |s| s.completed == true }
        @my_active_tutoring_as_tutor = my_tutoring_as_tutor.select{ |s| s.completed == false }
        @my_past_tutoring_as_tutor = my_tutoring_as_tutor.select{ |s| s.completed == true }
        @my_study_groups = @user.study_groups
        @my_notes = @user.notes

        #rating
        tutoring_sessions = TutoringSession.where(tutor_name: @user.name).select{ |t| t.completed == true }
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


        # payment history
        require 'stripe'
        Stripe.api_key = Rails.configuration.stripe[:secret_key]
        if current_user.card_token
            customer = Stripe::Customer.retrieve(current_user.card_token)
            @payment_history = Stripe::Charge.list(customer: customer)
        else
            @payment_history = []
        end
    end
    
    def edit
        @user = current_user
    end

    def update
        last_name_ =  params[:user][:last_name]
        first_name_ =  params[:user][:first_name]
        phone_num_ = params[:user][:phone_num]
        description_ = params[:user][:description]
        avatar_ = params[:user][:avatar]
        @user = current_user
        @user.last_name = last_name_
        @user.first_name = first_name_
        @user.phone_num = phone_num_
        @user.description = description_
        if avatar_
            @user.avatar.attach(avatar_)
        end

        if @user.save
            flash[:notice] = "Successfully update your information !"
            redirect_to :action => 'show', :id => current_user.id
        else
            flash.now[:error] = @user.errors.full_messages
            render 'edit'
        end
    end
end
