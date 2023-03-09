

class CommentsController < ApplicationController

    
    def index
   
        if params[:author_id]
            user_comments = Comment.where(author_id: params[:author_id])
            render json: user_comments

        elsif params[:artwork_id]
            artwork_comments = Comment.where(artwork_id: params[:artwork_id])
            render json: artwork_comments
        else
            render json: ['unprocessable entity'], status: 422
        end
       
    end
    def create
        new_comment = Comment.new(comment_params)
        if new_comment.save
            render json: new_comment, status: :created
        else
            render json: new_comment.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def destroy
        destroyed_comment = Comment.find_by(id: params[:id])
        if destroyed_comment && destroyed_comment.destroy
            render json: destroyed_comment
            # redirect_to artworks_url
        elsif !destroyed_comment
            render json: ['unprocessable entity'], status: 422
        else
            render json: destroyed_comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

   def  comment_params 
    params.require(:comment).permit(:author_id, :artwork_id, :body)

   end

end