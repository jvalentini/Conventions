class ConventionController < ApplicationController

  def initialize
    @resource_collection = self.controller_name
    @resource_name       = self.controller_name.singularize
    @resource_symbol     = @resource_name.to_sym
    @resource            = @resource_name.capitalize.constantize.new

    @resource_class_name = @resource.class.name.downcase
    require @resource_class_name
  end

  def resource_url
    self.send((@resource_collection + '_url').to_sym)
  end

  # GET /@resource
  # GET /@resource.json
  def index
    @collection = @resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /@resource/1
  # GET /@resource/1.json
  def show
    @member = @resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /@resource/new
  # GET /@resource/new.json
  def new
    @member = @resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /@resource/1/edit
  def edit
    @member = @resource.find(params[:id])
  end

  # POST /@resource
  # POST /@resource.json
  def create
    @member = @resource.new(params[@resource_symbol])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: '@resource was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /@resource/1
  # PUT /@resource/1.json
  def update
    @member = @resource.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[@resource_symbol])
        format.html { redirect_to @member, notice: '@resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@resource/1
  # DELETE /@resource/1.json
  def destroy
    @member = @resource.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to resource_url }
      format.json { head :no_content }
    end
  end
end
