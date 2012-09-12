class Survey < ActiveRecord::Base
  attr_accessible :name
  has_many :questions
  
  def self.next_question(survey_id, respondent_id)
    responses = Response.questions_answered(respondent_id)
    questions = Question.ids_for_survey(survey_id)
    question_id = (questions - responses).first
    if question_id
      Question.find(question_id)
    else
      nil
    end
  end
end
