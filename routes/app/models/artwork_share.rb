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
# create_table "artwork_shares", force: :cascade do |t|
#     t.bigint "artwork_id"
#     t.bigint "viewer_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artwork_id", "viewer_id"], name: "index_artwork_shares_on_artwork_id_and_viewer_id", unique: true
#     t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
#     t.index ["viewer_id"], name: "index_artwork_shares_on_viewer_id"

class ArtworkShare < ApplicationRecord

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: 'Artwork'
    
    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: 'User'
end
