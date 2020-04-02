class SessionsController < ApplicationController
    def new
    end
    
    def  create
     user = Users.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to '/'
     else
        redirect_to '/login'
    end

    def destroy
        session[:id] = nil
        redirect_to '/login'
    end
end
