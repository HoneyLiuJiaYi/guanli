class StatisticController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def statisticSex
    @maleCount = User.all.where(:sex => 'male').count
    @femaleCount = User.all.where(:sex => 'female').count
    if @maleCount && @femaleCount
      render :json => {:status => 0, :msg => 'success', :data => {:male => @maleCount, :female => @femaleCount}}
    else
      render :json => {:status => 1, :msg => 'fail', :data => {}}
    end
  end

  def statisticRegion
    @regions = Region.where(:level => 1)
    if @regions
      @arr = []
      @regions.each do |region|
        @count = Station.where(:region_id => region.id).count
        h = Hash[:region => region, :count => @count]
        @arr << h
      end
      render :json => {:status => 0, :msg => 'success', :data => {:statistic => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def logs
    @logs = Log.all
    if @logs
      render :json => {:status => 0, :msg => 'success', :data => {:logs => @logs}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
