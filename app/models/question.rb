class Question < ActiveRecord::Base
  attr_accessible :survey_id, :text, :type
end
