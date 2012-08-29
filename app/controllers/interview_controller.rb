class InterviewController < ApplicationController
  before_filter :set_survey, :set_respondent
  def start
    redirect_to :action => :next
  end
  
  def next
    # render :text => "yes"
    @question = Survey.next(@survey, @respondent)
    # if done redirect_to :action => :done 
  end

  def done
    # reset survey 
    # reset respondent
  end

private  
  def set_survey
    @survey ||= current_survey
  end
  def set_respondent
    @respondent ||= current_respondent
  end
end
