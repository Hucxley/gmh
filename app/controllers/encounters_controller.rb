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
    @campaign_characters = @campaign.characters.all
    @characters = @encounter.characters.all.to_a
  end

  def run
    @characters = @encounter.characters

    if params.has_key?(:characters)
      @encounter.initialize_characters(params[:characters])
    end
  end

  def show
    @characters = @encounter.characters

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    encounter_attributes = params.fetch(:encounter, {})
    @encounter = @campaign.encounters.build(encounter_attributes)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @characters = @encounter.characters
  end

  def create
    @encounter = @campaign.encounters.build(params[:encounter])

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to([@campaign, @encounter], :notice => 'Encounter was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      character_ids = params[:encounter][:character_ids] + @encounter.character_ids

      if @encounter.update_attributes(params[:encounter])
        @encounter.character_ids = character_ids
        @encounter.save
        format.html { redirect_to([@campaign, @encounter], :notice => 'Encounter was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to(campaign_encounters_path(@campaign)) }
    end
  end
end
