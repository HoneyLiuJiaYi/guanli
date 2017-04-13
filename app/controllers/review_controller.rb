class ReviewController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def reviewMerchant
    @merchants = Merchant.find_by_status(1)
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

end
