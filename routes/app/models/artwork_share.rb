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