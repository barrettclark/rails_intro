class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_survey, :current_respondent

  def current_survey
    survey = nil
    if session[:current_survey] && !session[:current_survey].nil?
      survey = Survey.find(session[:current_survey])
    else
      survey = pick_survey
      session[:current_survey] = survey.id
    end
    survey
  end
  
  def current_respondent
    respondent = nil
    if session[:current_respondent] && !session[:current_respondent].nil?
      respondent = Respondent.find(session[:current_respondent])
    else
      respondent = new_respondent
      session[:current_respondent] = respondent.id
    end
    respondent
  end
  
private
  def pick_survey
    Survey.limit(1).order("random()").first
  end
  
  def new_respondent
    Respondent.create!
  end
end
