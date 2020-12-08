class UsersController < ApplicationController
    before_action :logged_in?, only: [:show, :edit, :update, :destroy]
    #before_action :current_user?, only:[:show, :edit, :update, :destroy]
   

    def show
        if logged_in? 
            @user = User.find_by(id: session[:user_id])
            @user.books.build
        else
            redirect_to :root
            ##message: You need to be logged in to do that.
        end

    end

    def new
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            redirect_to user_path(@user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new 
        end

    end

    def edit
        if logged_in?
            @user = User.find_by(id: session[:user_id])
        else 
            redirect_to :root 
        end
        
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @user.update(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            render :edit 
            ##message: Something went wrong, try again.
        end

    end
    
##############################
    def destroy
       
    end

    private

    def user_params
        params.require(:user).permit(:username , :email, :password, :password_confirmation,
            books_attributes: [
                :title,
                :author,
                :read,
                :currently_own

            ]
        
        )
    end

   
end
