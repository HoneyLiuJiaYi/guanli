class ProductController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def edit
    @product = Product.find(params[:product_id])
    if params[:logo]
      uploaded_io = params[:logo]
      Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
      @logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
      if @product.update_attributes(:name => params[:name], :logo => @logo, :price => params[:price])
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      if @product.update_attributes(:name => params[:name], :price => params[:price])
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  def list
    @products = Category.find(params[:category_id]).products
    if @products
      render :json => {:status => 0, :msg => 'success', :data => {:products => @products}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stopProduct
    @product = Product.find(params[:product_id])
    if @product
      if @product.update_attributes(:is_delete => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def addProduct
    @category = Category.find(params[:category_id])
    @product = Product.new
    @product.name = params[:name]
    @product.price = params[:price]
    if params[:logo]
      uploaded_io = params[:logo]
      @product.logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
      Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
      @category.products << @product
      if @product.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      @product.logo = 'xxxxxxx'
      if @product.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end
end
