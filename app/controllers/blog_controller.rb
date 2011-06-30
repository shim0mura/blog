class BlogController < ApplicationController

  def index
    if params[:id]
      @entry = Contents.find(params[:id])
    end
  end

  def archive
  end

  def new
    if params[:confirm]
      @entry = Content.new(params[:entry])
    elsif params[:execute]
      @entry = Content.new(params[:entry])
      @entry.save!
    end

    @entry = Content.new
  end 

  def edit
    if params[:confirm]
      @entry = Content.new(params[:entry])
    elsif params[:execute]
      @entry = Content.find(params[:id])
      @entry = params[:entry]
      @entry.save!
    end

    @entry = Content.new
  end
end

