class TimeDataController < ApplicationController
  before_action :set_time_datum, only: [:new, :show, :edit, :update, :destroy]

  # GET /time_data
  # GET /time_data.json
  def index
    @time_data = TimeDatum.all
  end

  # GET /time_data/1
  # GET /time_data/1.json

  # Show time data and checking time
  def show

    # If there is no today's time data, creating.
      if !@time_datum.present?
        @time_datum = TimeDatum.new
      end
  end

  # GET /time_data/new
  def new
    # IF there is a time_datum redirecting show page
    if !@time_datum.present?
      @time_datum = TimeDatum.new
    else
      redirect_to '/time_data/'+ @member[:enum]
    end
  end

  # GET /time_data/1/edit
  def edit
  end

  # POST /time_data
  # POST /time_data.json
  def create
    @time_datum = TimeDatum.new(time_datum_params)

    respond_to do |format|
      if @time_datum.save
        format.html { redirect_to action: 'show', id: @time_datum.enum, notice: 'Time datum was successfully created.' }
        format.json { render :show, status: :created, location: @time_datum }
      else
        format.html { render :new }
        format.json { render json: @time_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_data/1
  # PATCH/PUT /time_data/1.json
  def update
    respond_to do |format|
      if @time_datum.update(time_datum_params)
        format.html { redirect_to @time_datum, notice: 'Time datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_datum }
      else
        format.html { render :edit }
        format.json { render json: @time_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_data/1
  # DELETE /time_data/1.json
  def destroy
    @time_datum.destroy
    respond_to do |format|
      format.html { redirect_to time_data_url, notice: 'Time datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_time_datum

      # At the first, collecting member and time data.
      # When check the time data, you should check enum and also today's date.
      @member = current_member
      # @time_datum = TimeDatum.new
      @time_datum = TimeDatum.where("enum = ? AND date = ?", @current_member[:enum], Time.now.strftime("%Y-%m-%d"))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_datum_params
      params.require(:time_datum).permit(:enum, :date, :start_time, :end_time, :avg_start_time, :avg_end_time)
    end
end
