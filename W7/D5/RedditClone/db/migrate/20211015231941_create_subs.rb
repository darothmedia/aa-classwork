class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    add_index :subs, :user_id
  end
end
