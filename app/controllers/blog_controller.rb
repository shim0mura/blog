class BlogController < ApplicationController

  def index
    if params[:path]
      @entry = Entry.find_by_path(params[:path])
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
      @entry = Entry.find_by_path(params[:path])
    elsif params[:execute]
      @entry = Entry.find(params[:id])
      @entry.update_attributes!(params[:entry])
    end

    @entry = Entry.find_by_path(params[:path])
  end  
end

