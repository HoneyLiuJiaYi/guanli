class RiderController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def bindRider
    @rider = Rider.find(params[:rider_id])
    @station = Station.find(params[:station_id])
    if @rider && @station
      RiderStationShip.create(:rider => @rider, :station => @station)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showRider
    if params[:region_id] == 0
      @riders = Rider.all
      render :json => {:status => 0, :msg => 'success', :data => {:riders => @riders}}
    else
      @riders = Rider.find_by_region_id(params[:region_id])
      render :json => {:status => 0, :msg => 'success', :data => {:riders => @riders}}
    end
  end

  def unbindRider
    @rider = Rider.find(params[:rider_id])
    @station = Station.find(params[:station_id])
    if @rider && @station
      @riderStation = RiderStationship.where(:rider => @rider, :station => @station)
      @riderStation.destroy
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
