class BlogController < ApplicationController

  def index
    if params[:path]
      @entry = Entry.find_by_path(params[:path])
      render :entry
      return
    end
    @entries = Entry.order('created_at DESC').page(params[:page])
  end

  def archive
    @entries = Entry.order('created_at DESC').page(params[:page]).per(50)
  end

  def new
    basic_authentication
    if params[:confirm]
      @entry = Entry.new(params[:entry])
      render :confirm
      return
    elsif params[:execute]
      @entry = Entry.new(params[:entry])
      @entry.save!
      redirect_to :index
      return
    end

    @entry = Entry.new
  end 

  def edit
    basic_authentication
    if params[:confirm]
      @entry = Entry.new(params[:entry])
      render :confirm
    elsif params[:execute]
      @entry = Entry.find_by_path(params[:path])
      @entry.update_attributes!(params[:entry])
      redirect_to :index
    end

    @entry = Entry.find_by_path(params[:path])
  end  
end

