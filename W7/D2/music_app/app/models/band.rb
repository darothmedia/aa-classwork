# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Band < ApplicationRecord
  has_many :albums,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Album
end
