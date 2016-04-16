class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]

  # GET /studies
  # GET /studies.json
  def index
    @studies = Study.all
    @sites = Site.all
  end

  # GET /studies/1
  # GET /studies/1.json
  def show
  end

  # GET /studies/new
  def new
    @study = Study.new
    @sites = Site.all
  end

  # GET /studies/1/edit
  def edit
    @sites = Site.all
    @selectedsite= Site.joins(:studysites).where(:"studysites.study_id"=> params[:id]).pluck(:name)
  end

  # POST /studies
  # POST /studies.json
  def create
    @study = Study.new(study_params)
    @site = Site.where(:name => params[:studysite])
    respond_to do |format|
      if @study.save
        @study.sites << @site
        format.html { redirect_to @study, notice: 'Study was successfully created.' }
        format.json { render :show, status: :created, location: @study }
      else
        set_site
        format.html { render :new }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /studies/1
  # PATCH/PUT /studies/1.json
  def update
    respond_to do |format|
      @site = Site.where(:name => params[:studysite])
      if @study.update(study_params)
        @study.sites.destroy_all
        @study.sites << @site
        format.html { redirect_to @study, notice: 'Study was successfully updated.' }
        format.json { render :show, status: :ok, location: @study }
      else
        update
        format.html { render :edit }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1
  # DELETE /studies/1.json
  def destroy
    @study.sites.destroy_all
    @study.destroy
    respond_to do |format|
      format.html { redirect_to studies_url, notice: 'Study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    def set_site
      @sites = Site.all
      @selectedsite= Site.joins(:studysites).where(:"studysites.study_id"=> params[:id]).pluck(:name)
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_params
      params.require(:study).permit(:id, :title, :principal_investigator, :status)
     # params.require(:site).permit(:name, :location)

    end
end
