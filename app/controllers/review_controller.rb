class ReviewController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def reviewMerchant
    @merchants = Merchant.all.where(:status => 1)
    if @merchants
      render :json => {:status => 0, :msg => 'success', :merchants => @merchants}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def postMerchant
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant
      if @merchant.update_attributes(:status => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 2, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'not exists this merchant'}
    end
  end

  def reviewRider
    @riders = Rider.all.where(:status => 1)
    if @riders
      render :json => {:status => 0, :msg => 'success', :riders => @riders}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def postRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      if @rider.update_attributes(:status => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'not exists this rider'}
    end
  end

end
