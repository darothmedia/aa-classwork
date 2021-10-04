# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
  validates :answer_choice_id, presence: true
  validates :user_id, presence: true
  validate :sibling_cannot_exist
  validate :creator_cannot_respond

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
  
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  has_one :question,
    through: :answer_choice,
    source: :question
  
  # has_many :sibling_responses,
  #   through: :question,
  #   source: :responses
    # .where.not(id: self.id)

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    self.sibling_responses.exists?(user_id: self.user_id)
  end

  def creator?
    self.question.poll.author.username == self.respondent.username
  end

  private

  def creator_cannot_respond
    if creator?
      errors[:user_id] << 'is the creator of this poll!'
    end
  end
  def sibling_cannot_exist
    if respondent_already_answered?
      errors[:answer_choice] << 'has already been selected'
    end
  end
end
