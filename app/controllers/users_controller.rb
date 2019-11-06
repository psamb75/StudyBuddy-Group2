class UsersController < ApplicationController
    #do we need auth part for it?
    def show
        @me = current_user
    end
    
    def edit
        @user = current_user
        
        #check current pw
        #check the two new pw matches or not
        
        
    end
end
