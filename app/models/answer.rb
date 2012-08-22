class Answer < ActiveRecord::Base
  attr_accessible :question_id, :sequence, :text, :value
  belongs_to :question
end
