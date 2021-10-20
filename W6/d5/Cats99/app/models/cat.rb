class Cat < ApplicationRecord
  validates :birth_date, :name, presence: true
  validates :sex, inclusion: {in: ['M', 'F']}
  validates :color, inclusion: {in: ['Brown', 'Black', 'White', 'Purple']}

  include ActionView::Helpers::DateHelper

  def age
    # distance_of_time_in_words(birth_date, Time.now).grep(/\d/)

    age = Time.now.year - birth_date.year 
    if age < 1
      age = (Time.now.month - birth_date.month).to_s 
      return age + " Months"
    else
      age = age.to_s
      return age + " Years"
    end
  end
end
