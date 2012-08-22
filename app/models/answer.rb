class Answer < ActiveRecord::Base
  attr_accessible :question_id, :sequence, :text, :value
end
