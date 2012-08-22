class RespondentsController < ApplicationController
  # GET /respondents
  # GET /respondents.json
  def index
    @respondents = Respondent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @respondents }
    end
  end

  # GET /respondents/1
  # GET /respondents/1.json
  def show
    @respondent = Respondent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @respondent }
    end
  end

  # GET /respondents/new
  # GET /respondents/new.json
  def new
    @respondent = Respondent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @respondent }
    end
  end

  # GET /respondents/1/edit
  def edit
    @respondent = Respondent.find(params[:id])
  end

  # POST /respondents
  # POST /respondents.json
  def create
    @respondent = Respondent.new(params[:respondent])

    respond_to do |format|
      if @respondent.save
        format.html { redirect_to @respondent, notice: 'Respondent was successfully created.' }
        format.json { render json: @respondent, status: :created, location: @respondent }
      else
        format.html { render action: "new" }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /respondents/1
  # PUT /respondents/1.json
  def update
    @respondent = Respondent.find(params[:id])

    respond_to do |format|
      if @respondent.update_attributes(params[:respondent])
        format.html { redirect_to @respondent, notice: 'Respondent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respondents/1
  # DELETE /respondents/1.json
  def destroy
    @respondent = Respondent.find(params[:id])
    @respondent.destroy

    respond_to do |format|
      format.html { redirect_to respondents_url }
      format.json { head :no_content }
    end
  end
end
