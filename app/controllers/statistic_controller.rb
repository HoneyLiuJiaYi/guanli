class StatisticController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def statisticMale
    @maleCount = User.find_by_sex("male").count
    @femaleCount = User.find_by_sex("female").count
    if @maleCount && @femaleCount
      render :json => {:status => 0, :msg => 'success', :data => {:male_count => @maleCount, :female_count => @female}}
    else
      render :json => {:status => 1, :msg => 'fail', :data => {}}
    end
  end
end
