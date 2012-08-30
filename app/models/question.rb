class Question < ActiveRecord::Base
  attr_accessible :survey_id, :text, :kind
  
  belongs_to :survey
  has_many :answers
  
  TYPES = [ 'radio', 'checkbox' ]
  
  def self.ids_for_survey(survey)
    find_all_by_survey_id(survey.id, :select => :id, :order => :id).map(&:id)
  end
end
