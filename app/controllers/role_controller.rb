class RoleController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def roleList
    @roles = Role.all
    render :json => {:status => 0, :msg => 'success', :data => {:role => @roles}}
  end

  def roleService
    if params[:role_id]
      @roots = Role.find(params[:role_id]).services.where(:pid => 0)
      @father = []
      @roots.each do |root|
        @services = Role.find(params[:role_id]).service.where(:pid => root.id)
        child = Hash.new
        child[:root] = root.function
        h = Hash.new
        @services.each do |service|
          h[:root] = service.function
          h[:url] = service.url
        end
        child[:child] = h
        @father << child
      end
      render :json => {:status => 0, :msg => 'success', :data => {:service => @father}}
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end

  def notService
    if params[:role_id]
      @nss = Service.where(:pid != 0)
      @rss = Role.find(params[:role_id])
      @arr = []
      @nss.each do |ns|
        flag = 0
        @rss.each do |rs|
          if rs.id == ns.id
            flag = 1
            break
          end
        end
        if flag == 0
          h = Hash.new
          h[:id] = ns.id
          h[:function] = ns.function
          h[:fatcher] = Service.find(ns.pid).function
          @arr << h
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:service => @arr}}
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end

  def addService
    if params[:role_id] && params[:service_id]
      @service = Service.find(params[:service_id])
      @father = Service.find(@service.pid)
      if Role.find(params[:role_id]).service.where(:id => @service.pid) == nil
        @rs = RoleServiceship.new
        @rs.role_id = params[:role_id]
        @rs.service_id = @service.pid
        @rs.save
      end
      @ra = RoleServiceship.new
      @ra.role_id = params[:role_id]
      @ra.service_id = params[:service_id]
      if @ra.save
        render :json => {:status => 0, :msg => 'success'};
      else
        render :json => {:status => 1, :msg => '权限角色无法保存'}
      end
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end


end
