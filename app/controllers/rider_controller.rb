class RiderController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def bindRider
    @rider = Rider.find(params[:rider_id])
    @station = Station.find(params[:station_id])
    if @rider && @station
      RiderStationship.create(:rider => @rider, :station => @station)
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
    if params[:rider_id] && params[:station_id]
      ActiveRecord::Base.connection.execute 'delete from rider_stationships where rider_id=' + params[:rider_id] + ' and station_id= ' + params[:station_id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stationRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      @stations = @rider.stations.where(:is_del => 0)
      @arr = []
      @stations.each do |station|
        @arr << Address.find(station.address_id)
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @stations, :addresses => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def unstation
    @rider = Rider.find(params[:rider_id])
    @all = Station.where(:is_del => 0)
    @stations = @rider.stations.where(:is_del => 0)
    if @rider && @all
      @arr = []
      @all.each do |sta|
        @a = 0
        @stations.each do |ss|
          if ss.id == sta.id
            @a = 1
            break
          end
        end
        if @a == 0
          @arr << sta
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
