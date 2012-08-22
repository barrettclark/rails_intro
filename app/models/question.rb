class Question < ActiveRecord::Base
  attr_accessible :survey_id, :text, :kind
  
  belongs_to :survey
  has_many :answers
end
