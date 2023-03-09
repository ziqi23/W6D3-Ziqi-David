# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :bigint
#
# Indexes
#
#  index_artworks_on_artist_id            (artist_id)
#  index_artworks_on_artist_id_and_title  (artist_id,title) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => users.id)
#
class Artwork < ApplicationRecord


    def self.artworks_for_user_id(user_id)
        completed_artworks = Artwork.where(artist_id: incoming_wildcard)
        shared_artworks = ArtworkShare.where(viewer_id: incoming_wildcard)

    end

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
