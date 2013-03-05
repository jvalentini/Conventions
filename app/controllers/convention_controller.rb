class ConventionController < ApplicationController

  def initialize
    @resource_collection = self.controller_name
    @resource_name       = self.controller_name.singularize
    @resource_symbol     = @resource_name.to_sym
    @resource            = @resource_name.capitalize.constantize
  end

  def resource_url
    self.send((@resource_collection + '_url').to_sym)
  end

  def collection
    instance_variable_get('@' + @resource_collection)
  end

  def collection= value
    instance_variable_set('@' + @resource_collection, value)
  end

  def member
    instance_variable_get('@' + @resource_name)
  end

  def member= value
    instance_variable_set('@' + @resource_name, value)
  end

  # GET /@resource
  # GET /@resource.json
  def index
    self.collection = @resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: self.collection }
    end
  end

  # GET /@resource/1
  # GET /@resource/1.json
  def show
    self.member = @resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: self.member }
    end
  end

  # GET /@resource/new
  # GET /@resource/new.json
  def new
    self.member = @resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: self.member }
    end
  end

  # GET /@resource/1/edit
  def edit
    self.member = @resource.find(params[:id])
  end

  # POST /@resource
  # POST /@resource.json
  def create
    self.member = @resource.new(params[@resource_symbol])

    respond_to do |format|
      if self.member.save
        format.html { redirect_to self.member, notice: '@resource was successfully created.' }
        format.json { render json: self.member, status: :created, location: self.member }
      else
        format.html { render action: "new" }
        format.json { render json: self.member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /@resource/1
  # PUT /@resource/1.json
  def update
    self.member = @resource.find(params[:id])

    respond_to do |format|
      if self.member.update_attributes(params[@resource_symbol])
        format.html { redirect_to self.member, notice: '@resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: self.member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@resource/1
  # DELETE /@resource/1.json
  def destroy
    self.member = @resource.find(params[:id])
    self.member.destroy

    respond_to do |format|
      format.html { redirect_to resource_url }
      format.json { head :no_content }
    end
  end
end
