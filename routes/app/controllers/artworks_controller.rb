

class ArtworksController < ApplicationController

    def index
        #debugger
        incoming_wildcard = params[:user_id]
        all_artworks = Artwork.artworks_for_user_id(incoming_wildcard)
        render json: all_artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork, status: :created
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        incoming_wildcard = params[:id]
        artwork = Artwork.find(incoming_wildcard)
        if artwork
            render json: artwork
        else
            render json: ['not found'], status: 404
        end
    end

    def update
     
        artwork = Artwork.find_by(id: params[:id])
        if artwork && artwork.update(artwork_params)
            redirect_to artwork_url(artwork.id)
        elsif !artwork
            render json: ['unprocessable entity'], status: 422
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork && artwork.destroy
            render json: artwork
            # redirect_to artworks_url
        elsif !artwork
            render json: ['unprocessable entity'], status: 422
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    
    
    
    private

    def  artwork_params 
     params.require(:artwork).permit(:title, :image_url, :artist_id)
 
    end
 

end