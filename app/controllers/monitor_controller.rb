class MonitorController < ApplicationController
  def show
    @reading = Reading.last

    respond_to do |format|
      format.json { render json: @reading.to_json }
      format.html
    end
  end

  def footprint
    @hourly_averages = Reading.hourly_averages

    respond_to do |format|
      format.json { render json: @hourly_averages.to_json }
      format.html
    end
  end
end
