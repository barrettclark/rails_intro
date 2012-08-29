class Response < ActiveRecord::Base
  attr_accessible :answer_id, :respondent_id
  
  def self.questions_answered(respondent)
    find_all_by_respondent_id(respondent.id, :select => :question_id, :order => :question_id).map(&:question_id)
  end
end
