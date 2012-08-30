class Survey < ActiveRecord::Base
  attr_accessible :name
  has_many :questions
  
  def self.next(survey, respondent)
    respondent = Response.questions_answered(respondent)
    questions = Question.ids_for_survey(survey)
    (questions - responses).first
  end
end
