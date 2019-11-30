class UsersController < ApplicationController
    #do we need auth part for it?
    def show
        @user = User.find(params[:id])
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
        avatar_ = params[:user][:avatar]
        @user = current_user
        @user.last_name = last_name_
        @user.first_name = first_name_
        @user.phone_num = phone_num_
        @user.description = description_
        @user.avatar.attach(avatar_)
        if @user.save
            flash.now[:notice] = "Successfully update your information !"
            @my_courses = @user.enrolments
            render 'show'
        else
            flash.now[:error] = @user.errors.full_messages
            render 'edit'
        end
    end
end
