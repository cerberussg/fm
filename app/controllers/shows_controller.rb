class ShowsController < ApplicationController
  before_action :set_federation
  before_action :set_show, only: %i[show edit update destroy]

  # GET /shows
  # GET /shows.json
  def index
    @shows = @federation.shows
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = @federation.shows.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = @federation.shows.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to federation_shows_path, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to federation_shows_path(@federation), notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to federation_shows_path, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = @federation.shows.find_by(federation_id: params[:federation_id], id: params[:id])
    end

    def set_federation
      @federation = Federation.find_by(id: params[:federation_id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(:name, :number_of_matches, :day_of_week, :federation_id)
    end
end
