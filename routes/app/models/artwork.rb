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
        completed_artworks = Artwork.where(artist_id: user_id).select('*')
        shared_artworks = ArtworkShare.joins(:artwork).where(viewer_id: user_id).select('artworks.*')

        all_artworks = completed_artworks + shared_artworks #[1, 3, 4, 6]


         
    end

    validates :title, :artist_id, presence:true
    validates :image_url, uniqueness: true, presence:true
    validates :title, uniqueness: { scope: :artist_id,
        message: "An artist should have unqiuely titled works"}


    belongs_to :artist,
        class_name: 'User',
        inverse_of: :artworks
         # foreign_key: :artist_id,

    has_many :artwork_shares,
        inverse_of: :artwork,
        dependent: :destroy
        # foreign_key: :artwork_id,
        # class_name: 'ArtworkShare',

    has_many :comments,
        inverse_of: :artwork,
        dependent: :destroy

    

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end
