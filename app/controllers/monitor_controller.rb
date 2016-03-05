class MonitorController < ApplicationController
  def show
    @reading = Reading.last

    respond_to do |format|
      format.json do
        render json: @reading.to_json
      end

      format.html
    end
  end
end
