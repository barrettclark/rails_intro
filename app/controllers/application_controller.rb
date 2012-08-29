class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_survey, :current_respondant
  
  
  def current_survey
    session[:current_survey] ||= pick_survey
  end
  
  def current_respondent
    session[:current_respondent] ||= new_respondent
  end
  
private  
  def pick_survey
    Survey.limit(1).order("random()")
  end
  
  def new_respondent
    Respondent.new
  end
  
end
