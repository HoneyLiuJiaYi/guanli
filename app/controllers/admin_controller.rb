class AdminController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def edit
    @admin = Admin.find(params[:admin_id])
    if @admin
      if @admin.update_attributes(:nick => params[:nick], :password => params[:password], :role_id => params[:role_id])
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'save  fail'}
      end
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
    @region = Region.find(params[:region_id])
    @admin.region = @region
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

  def showAdminStation
    @admin = Admin.find(params[:admin_id])
    @region = Region.find(@admin.region_id)
    @stations = Station.find_by_region_id(@region.id)
    if @stations
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @stations}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAdminRegion
    @admin = Admin.find(params[:admin_id])
    @region = Region.find(@admin.region_id)
    if @region
      render :json => {:status => 0, :msg => 'success', :data => {:region => @region}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def destroyAdminStation
    @station = Station.find(params[:station_id])
    if @station
      @address = Address.find(@station.address_id)
      @address.destroy
      @station.destroy
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
