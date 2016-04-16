class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
    @studies = Study.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @site = Site.new
    @studies = Study.all
  end

  # GET /sites/1/edit
  def edit
    @studies = Study.all
    @selectedstudy= Study.joins(:studysites).where(:"studysites.site_id"=> params[:id]).pluck(:title)
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)
    @study = Study.where(:title => params[:studysite])

    respond_to do |format|
      if @site.save
         @site.studies << @study
         format.html { redirect_to @site, notice: 'Site was successfully created.' }
         format.json { render :show, status: :created, location: @site }
      else
         set_study
         format.html { render :new }
         format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    @study = Study.where(:title => params[:studysite])
    respond_to do |format|
      if @site.update(site_params)
        @site.studies.destroy_all
        @site.studies << @study
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        set_study
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.studies.destroy_all
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    def set_study
      @studies = Study.all
      @selectedstudy= Study.joins(:studysites).where(:"studysites.site_id"=> params[:id]).pluck(:title)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:id, :name, :location)
    end
end
