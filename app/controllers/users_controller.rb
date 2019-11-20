class UsersController < ApplicationController
    #do we need auth part for it?
    def show
        @user = current_user
        @my_courses = @user.enrolments
    end
    
    def edit
        @user = current_user
    end

    def update
        last_name_ =  params[:user][:last_name]
        first_name_ =  params[:user][:first_name]
        phone_num_ = params[:user][:phone_num]
        description_ = params[:user][:description]
        @user = current_user
        @user.update_attribute(:last_name, last_name_)
        @user.update_attribute(:first_name, first_name_)
        @user.update_attribute(:phone_num, phone_num_)
        @user.update_attribute(:description, description_)
        
        @my_courses = @user.enrolments
        render 'show'
    end
end
