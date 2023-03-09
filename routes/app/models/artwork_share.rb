# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :bigint
#  viewer_id  :bigint
#
# Indexes
#
#  index_artwork_shares_on_artwork_id                (artwork_id)
#  index_artwork_shares_on_artwork_id_and_viewer_id  (artwork_id,viewer_id) UNIQUE
#  index_artwork_shares_on_viewer_id                 (viewer_id)
#
# Foreign Keys
#
#  fk_rails_...  (artwork_id => artworks.id)
#  fk_rails_...  (viewer_id => users.id)
#

class ArtworkShare < ApplicationRecord

    belongs_to :artwork,
      inverse_of: :artwork_shares
        
    
    # foreign_key: :artwork_id,
    # class_name: 'Artwork'
    
    belongs_to :viewer,
        class_name: 'User',
        inverse_of: :artwork_shares
          # foreign_key: :viewer_id,
      
end
