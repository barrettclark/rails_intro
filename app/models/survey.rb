class Survey < ActiveRecord::Base
  attr_accessible :name
  has_many :questions
  
  def self.next(survey, respondent)
    # responses left join with survey / repondent where responce is null for question
  end
end
