class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:questions)
  end
end
