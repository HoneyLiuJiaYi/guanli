class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    admin = Admin.find_by_nick(param[:nick]).try(:authenticate, merchant_params[:password])
    if admin
      session[:current_admin_id]  = admin.id
      render :json => {:status => 0, :msg => 'success', :data => {:admin_id => admin.id}}
    else
      render :json => {:status => 1, :msg => 'fail', :data => {}}
    end
  end

  def destroy
    session[:current_admin_id] = nil
    render :json => {:status => 0, :msg => 'success'}
  end
end
