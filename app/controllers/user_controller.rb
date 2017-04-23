class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def list
    @users = User.all
    if @users
      render :json => {:status => 0, :msg => 'success', :data => {:users => @users}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stopUser
    @user = User.find(params[:user_id])
    if @user
      if @user.update_attributes(:is_del => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'not the user'}
    end
  end

  def activeUser
    @user = User.find(params[:user_id])
    if @user
      if @user.update_attributes(:is_del => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'not the user'}
    end
  end

  def addAddress
    if params[:lat] == null || params[:lng] == null
      render :json => {:status => 1, :msg => '经纬度错误'}
    else
      @address = Address.new(:lat => params[:lat], :lng => params[:lng], :comment => params[:comment])
      if @address.save
        @user = User.find(params[:user_id])
        UserAdddressship.create(:user => @user, :address => @address)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '保存失败'}
      end
    end
  end
end
