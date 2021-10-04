class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.integer :poll_id, null:false
    end

    add_index :questions, :body
    add_index :questions, :poll_id
  end
end
