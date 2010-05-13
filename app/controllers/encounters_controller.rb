class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @encounter = Encounter.find(params[:id])
    @characters = Character.all

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @encounter = Encounter.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @encounter = Encounter.find(params[:id])
  end

  def create
    @encounter = Encounter.new(params[:encounter])

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to(@encounter, :notice => 'Encounter was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @encounter = Encounter.find(params[:id])

    respond_to do |format|
      if @encounter.update_attributes(params[:encounter])
        format.html { redirect_to(@encounter, :notice => 'Encounter was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to(encounters_url) }
    end
  end
end
