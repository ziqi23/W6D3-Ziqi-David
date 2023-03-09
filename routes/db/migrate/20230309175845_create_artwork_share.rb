class CreateArtworkShare < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, foreign_key: true
      t.references :viewer, foreign_key: {to_table: :users}
      t.timestamps
    end
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique:true
  end
end
