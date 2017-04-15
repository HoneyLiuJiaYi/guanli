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
end
