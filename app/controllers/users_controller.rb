class UsersController < ApplicationController
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
        @user.avatar.attach(avatar_)
        if @user.save
            flash.now[:notice] = "Successfully update your information !"
            redirect_to :action => 'show', :id => current_user.id
        else
            flash.now[:error] = @user.errors.full_messages
            render 'edit'
        end
    end
end
