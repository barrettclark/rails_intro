class InterviewController < ApplicationController
  before_filter :set_survey, :set_respondent

  # /start
  def start
    redirect_to :action => :next
  end
  
  # /next
  def next
    logger.debug current_survey
    @question = Survey.next(@survey, @respondent)
    if @question.nil?
      redirect_to :action => :done
    end
  end

  # /done
  def done
    render :text => "Thank you"
    # reset survey
    # reset respondent
  end

private
  def set_survey
    @survey ||= current_survey
    logger.debug "the survey is #{@survey.inspect}"
  end
  def set_respondent
    @respondent ||= current_respondent
    logger.debug "the respondent is #{@respondent.inspect}"
  end
end
