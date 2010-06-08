class EncountersController < ApplicationController

  before_filter :find_campaign
  before_filter :find_encounter, :only => [:init, :run, :show, :edit, :update, :destroy]

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def find_encounter
    @encounter = @campaign.encounters.find(params[:id])
  end

  def index
    @encounters = @campaign.encounters.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def init
    @characters = @encounter.characters.all
  end

  def run
    @characters = []

    params["characters"].each do |char, roll|
      char = Character.find(char)
      init = roll[:roll].to_i + char.initiative
      @characters << [char.name, init]
    end

    @characters = @characters.sort_by { |c, i| -i}
  end

  def show
    @characters = []
    # @characters = @encounter.characters.all

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @encounter = @campaign.encounters.new(params[:encounter])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @characters = []
    # @characters = @encounter.characters.all
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
    respond_to do |format|
      if @encounter.update_attributes(params[:encounter])
        format.html { redirect_to(@encounter, :notice => 'Encounter was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to(encounters_url) }
    end
  end
end
