class FederationsController < ApplicationController
  before_action :set_federation, only: [:show, :edit, :update, :destroy]

  # GET /federations
  # GET /federations.json
  def index
    @federations = Federation.all
  end

  # GET /federations/1
  # GET /federations/1.json
  def show
  end

  # GET /federations/new
  def new
    @federation = Federation.new
  end

  # GET /federations/1/edit
  def edit
  end

  # POST /federations
  # POST /federations.json
  def create
    @federation = Federation.new(federation_params)

    respond_to do |format|
      if @federation.save
        format.html { redirect_to @federation, notice: 'Federation was successfully created.' }
        format.json { render :show, status: :created, location: @federation }
      else
        format.html { render :new }
        format.json { render json: @federation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federations/1
  # PATCH/PUT /federations/1.json
  def update
    respond_to do |format|
      if @federation.update(federation_params)
        format.html { redirect_to @federation, notice: 'Federation was successfully updated.' }
        format.json { render :show, status: :ok, location: @federation }
      else
        format.html { render :edit }
        format.json { render json: @federation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /federations/1
  # DELETE /federations/1.json
  def destroy
    divisions = Division.where(federation_id: @federation)
    divisions.each do |division|
      division.destroy
    end
    @federation.destroy
    respond_to do |format|
      format.html { redirect_to federations_url, notice: 'Federation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federation
      @federation = Federation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def federation_params
      params.require(:federation).permit(:name, :description)
    end
end
