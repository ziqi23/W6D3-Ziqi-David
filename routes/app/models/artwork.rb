

class Artwork < ApplicationRecord

    validates :title, :artist_id, presence:true
    validates :image_url, uniqueness: true, presence:true
    validates :title, uniqueness: { scope: :artist_id,
        message: "An artist should have unqiuely titled works"}


    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: 'User'

    has_many :viewers,
        foreign_key: :artwork_id,
        class_name: 'ArtworkShare'

    has_many :shared_viewers,
        through: :viewers,
        source: :viewer
end