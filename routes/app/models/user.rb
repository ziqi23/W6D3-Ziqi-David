# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord

    validates :username, presence:true, uniqueness:true

    has_many :artworks,
        foreign_key: :artist_id,
        inverse_of: :artist,
        dependent: :destroy
        # class_name: 'Artwork',

    has_many :comments,
        foreign_key: :author_id,
        inverse_of: :author,
        dependent: :destroy

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        inverse_of: :viewer,
        dependent: :destroy
        # class_name: 'ArtworkShare',
       

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork
end
