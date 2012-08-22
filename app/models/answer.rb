class Answer < ActiveRecord::Base
  attr_accessible :question_id, :sequence, :text, :value
  belongs_to :question
  
  validates_uniqueness_of :sequence, :scope => :question_id
  validates_uniqueness_of :value, :scope => :question_id
end
