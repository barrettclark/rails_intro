class InterviewController < ApplicationController
  before_filter :set_survey, :set_respondent, :except => :done

  # /start
  def start
    redirect_to :action => :next
  end
  
  # /next
  def next
    logger.debug current_survey
    # save the posted data
    if request.post?
      answer = Answer.find(params[:answer].to_i)
      Response.create!(
        :question_id    => params[:question_id],
        :answer_id      => answer.id,
        :value          => answer.value,
        :respondent_id  => current_respondent.id
      )
    end
    @question = Survey.next_question(@survey, @respondent)
    logger.debug "the question is #{@question.inspect}"
    if @question.nil?
      redirect_to :action => :done
    end
  end

  # /done
  def done
    session[:current_survey] = nil
    session[:current_respondent] = nil
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
