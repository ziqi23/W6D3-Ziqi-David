

class Artwork < ApplicationRecord

    validates :title, :artist_id, presence:true
    validates :image_url, :uniqueness: true, presence:true
    validates :title, uniqueness: { scope: :artist_id,
        message: "An artist should have unqiuely titled works"}


      


end