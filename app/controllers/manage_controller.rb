class ManageController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def manageMerchant
    @merchants = Merchant.all
    if @merchants
      render :json => {:status => 0, :msg => 'success', :merchants => @merchants}
    else
      render :json => {:status => 1, :msg =>'fail'}
    end
  end

  def stopMerchant
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant
      if @merchant.update_attributes(:is_delete => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this merchant'}
    end
  end

  def activeMerchant
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant
      if @merchant.update_attributes(:is_delete => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this merchant'}
    end
  end

  def manageRider
    @riders = Rider.all
    if @riders
      render :json => {:status => 0, :msg => 'success', :riders => @riders}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stopRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      if @rider.update_attributes(:is_del => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this rider'}
    end
  end

  def activeRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      if @rider.update_attributes(:is_del => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this rider'}
    end
  end

  def manageUser
    @users = User.all
    if @users
      render :json => {:status => 0, :msg => 'success', :users => @users}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAdmin
    @admins = Admin.all.where(:is_del => 0)
    if @admins
      render :json => {:status => 0, :msg => 'success', :data => @admins}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def addAdmin
    @admin = Admin.new
    @admin.nick = params[:nick]
    @admin.password = params[:password]
    @admin.role_id = params[:role_id]
    if @admin.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def removeAdmin
    @admin = Admin.find(params[:admin_id])
    if @admin.update_attributes(:is_del => 1)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
