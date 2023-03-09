

class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        incoming_wildcard = params[:id]
        user = User.find(incoming_wildcard)
        if user
            render json: user
        else
            render json: ['not found'], status: 404
        end
    end

    def update

    end

    def destroy
        
    end

    private

   def  user_params 
    params.require(:user).permit(:name, :email)

   end

end