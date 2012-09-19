class Response < ActiveRecord::Base
  attr_accessible :answer_id, :respondent_id, :question_id, :value
  validates_presence_of :respondent_id, :value, :answer_id
  
  def self.questions_answered(respondent_id)
    find_all_by_respondent_id(respondent_id, :select => :question_id, :order => :question_id).map(&:question_id)
  end
end
