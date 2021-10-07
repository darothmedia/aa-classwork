class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :artwork_shares, name: 'index_artwork_shares_on_viewer_id_and_artwork_id'
  end
end
