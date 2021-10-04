# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  validates :body, presence: true, uniqueness: true
  validates :poll_id, presence: true
  
  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
  
  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    h = Hash.new {|k,v| k[v] = 0}
    self.answer_choices.each do |choice| 
      h[choice.body] = choice.responses.length
    end
    h

    self.select('questions.answer_choices', 'COUNT(questions.responses)').
  end
end
