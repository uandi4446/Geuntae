class TimeDataController < ApplicationController
  before_action :set_time_datum, only: [:new, :show, :edit, :update, :destroy, :create]

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

  # POST /time_data
  # POST /time_data.json
  def create
    @time_datum = TimeDatum.new(time_datum_params)

    respond_to do |format|  
      if @time_datum.save

        # Adding avg time for start_time
        if @avg_time_datum.present?
          # Calculating the avg start time and retunred.
          @avg_time_datum.avg_start_time = cal_avg_time(@avg_time_datum.avg_start_time.strftime("%H:%M"), @time_datum.start_time.strftime("%H:%M"))
          @avg_time_datum.save
        else
          @avg_time_datum = AvgTimeDatum.new({:enum => @time_datum.enum, :avg_start_time => @time_datum.start_time, :avg_end_time => "18:00"})
          @avg_time_datum.save
        end

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

        # Adding avg time for end_time
        if @avg_time_datum.present?
          # Calculating the avg start time and retunred. The returned value set as avg_end_time and using to update.
          @avg_time_datum.update({:avg_end_time => cal_avg_time(@avg_time_datum.avg_end_time.strftime("%H:%M"), @time_datum.end_time.strftime("%H:%M"))})
        end
        
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

  # Calculating avg_time
  # parameter : avg_time - exisiting average time, today_time - today's recorded time
  def cal_avg_time(avg_time, today_time)

    avg_time = avg_time.split(/:/)
    avg_minute = avg_time[0].to_i*60 + avg_time[1].to_i

    today_time = today_time.split(/:/)
    today_minute = today_time[0].to_i*60 + today_time[1].to_i

    avg_time_for_today = (avg_minute+today_minute)/2

    hour = avg_time_for_today / 60
    minute = avg_time_for_today - (hour*60)

    return (hour.to_s + ":" + minute.to_s)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_time_datum

      # At the first, collecting member and time data.
      # When check the time data, you should check enum and also today's date.
      @member = current_member
      @time_datum = TimeDatum.where("enum = ? AND date = ?", @current_member[:enum], Time.now.strftime("%Y-%m-%d"))[0]
      @avg_time_datum = AvgTimeDatum.where("enum = ?", @current_member[:enum])[0]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_datum_params
      params.require(:time_datum).permit(:enum, :date, :start_time, :end_time, :avg_start_time, :avg_end_time)
    end
end