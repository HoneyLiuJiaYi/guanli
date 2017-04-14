class StatisticController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def statisticSex
    @maleCount = User.all.where(:sex => 0).count
    @femaleCount = User.all.where(:sex => 1).count
    if @maleCount && @femaleCount
      render :json => {:status => 0, :msg => 'success', :data => {:male => @maleCount, :female => @femaleCount}}
    else
      render :json => {:status => 1, :msg => 'fail', :data => {}}
    end
  end
end
