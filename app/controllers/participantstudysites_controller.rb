class ParticipantstudysiteController < ApplicationController
	before_action :set_participantstudysite, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participants = Participant.all
    @allstudy= Studysite.select("sites.name||' - '||sites.location||'-'||studies.title||'-'||studies.principal_investigator as text,studysites.id as key").joins(:site,:study)
    
    #sql = "SELECT studysites.id as id, sites.name ||'-'||studies.title as text FROM studysites
    # INNER JOIN sites ON sites.id = studysites.site_id INNER JOIN studies 
    # ON studies.id = studysites.study_id"
   # @allstudy2 = ActiveRecord::Base.connection.execute(sql)
   
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    @studysite = Studysite.where('id = ?', params[:sitestudy]) 
    #@study = Study.where(:title => params[:studysite])
    #@allstudy= Studysite.includes(:sites,:studies)
    respond_to do |format|
      if @participant.save
        #@participant.studysites.build 
        @participant.studysites << @studysite
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        set_studysite
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.studysite.destroy_all
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participantstudysite
      @participantstudysite = Participantstudysite.find(params[:id])
    end

    def set_studysite
      @sites = Site.joins(:studysites)
      @studies = Study.joins(:studysites)
      @allstudy= Studysite.select("sites.name||' - '||sites.location||'-'||studies.title||'-'||studies.principal_investigator as text,studysites.id as key").joins(:site,:study)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participantstudysite).permit(:id, :participant_id, :studysite_id)
    end
end
