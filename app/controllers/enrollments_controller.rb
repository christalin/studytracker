class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollment = Participantstudysite.new
    @participants = Participant.all
    @allstudy= Studysite.select("sites.name||'('||sites.location||')-'||studies.title||'('||studies.principal_investigator||')' as text,studysites.id as key").joins(:site,:study)

  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Participantstudysite.new
    @participants = Participant.all
    @allstudy= Studysite.select("sites.name||'('||sites.location||')-'||studies.title||'('||studies.principal_investigator||')' as text,studysites.id as key").joins(:site,:study)
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Participantstudysite.new(enrollment_params)
    @study_id=Studysite.where(:id=> enrollment_params[:studysite_id]).pluck(:study_id).first

    @enrollment.study_id=@study_id
    @allstudy= Studysite.select("sites.name||'('||sites.location||')-'||studies.title||'('||studies.principal_investigator||')' as text,studysites.id as key").joins(:site,:study)
    @participants = Participant.all

    respond_to do |format|
      if @enrollment.save

        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Participantstudysite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.permit(:id, :participant_id, :studysite_id, :study_id)
      #params.require(:participantstudysites).permit(:id, :participant_id, :studysite_id )
    end
end
