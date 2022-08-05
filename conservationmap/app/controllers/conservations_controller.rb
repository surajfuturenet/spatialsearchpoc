class ConservationsController < ApplicationController
  before_action :set_conservation, only: %i[ show edit update destroy ]

  # GET /conservations or /conservations.json
  def index
   # @conservations = Conservation.all
    
  if params[:query].present?
    @pagy, @conservations  = pagy(Conservation.where("address LIKE ?", "%#{params[:query]}%")) 
  else
     @pagy, @conservations = pagy(Conservation.all)
  end

  if turbo_frame_request?
    render partial: "conservations", locals: { conservations: @conservations }
  else
    render :index
  end
  
  end

  # GET /conservations/1 or /conservations/1.json
  def show
  end

  # GET /conservations/new
  def new
    @conservation = Conservation.new
  end

  # GET /conservations/1/edit
  def edit
  end

  # POST /conservations or /conservations.json
  def create
    @conservation = Conservation.new(conservation_params)

    respond_to do |format|
      if @conservation.save
        format.html { redirect_to conservation_url(@conservation), notice: "Conservation was successfully created." }
        format.json { render :show, status: :created, location: @conservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conservations/1 or /conservations/1.json
  def update
    respond_to do |format|
      if @conservation.update(conservation_params)
        format.html { redirect_to conservation_url(@conservation), notice: "Conservation was successfully updated." }
        format.json { render :show, status: :ok, location: @conservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conservations/1 or /conservations/1.json
  def destroy
    @conservation.destroy

    respond_to do |format|
      format.html { redirect_to conservations_url, notice: "Conservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conservation
      @conservation = Conservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conservation_params
      params.require(:conservation).permit(:name, :address, :polygonid, :partid, :pointid, :longitude, :latitude, :description)
    end
end
