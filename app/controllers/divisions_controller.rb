class DivisionsController < ApplicationController
  before_action :set_federation
  before_action :set_division, only: %i[show edit update destroy]

  # GET /divisions
  # GET /divisions.json
  def index
    @divisions = @federation.divisions
  end

  # GET /divisions/1
  # GET /divisions/1.json
  def show
  end

  # GET /divisions/new
  def new
    @division = @federation.divisions.build
  end

  # GET /divisions/1/edit
  def edit
  end

  # POST /divisions
  # POST /divisions.json
  def create
    @division = @federation.divisions.build(division_params)

    respond_to do |format|
      if @division.save
        format.html { redirect_to federation_divisions_path(@federation), notice: 'Division was successfully created.' }
        format.json { render :show, status: :created, location: @division }
      else
        format.html { render :new }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divisions/1
  # PATCH/PUT /divisions/1.json
  def update
    respond_to do |format|
      if @division.update(division_params)
        format.html { redirect_to federation_divisions_path(@federation), notice: 'Division was successfully updated.' }
        format.json { render :show, status: :ok, location: @division }
      else
        format.html { render :edit }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    @division.destroy
    respond_to do |format|
      format.html { redirect_to federation_divisions_path, notice: 'Division was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = @federation.divisions.find_by(federation_id: params[:federation_id], id: params[:id])
      puts @division
    end

    def set_federation
      @federation = Federation.find_by(id: params[:federation_id])
    end

    # Only allow a list of trusted parameters through.
    def division_params
      params.require(:division).permit(:name, :federation_id)
    end
end
