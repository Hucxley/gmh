class CharactersController < ApplicationController
  before_filter :find_campaign
  before_filter :find_character, :only => [:show, :edit, :update, :destroy]

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def find_character
    @character = @campaign.characters.find(params[:id])
  end

  def index
    @characters = @campaign.characters.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @character = @campaign.characters.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
  end

  def create
    @character = @campaign.characters.build(params[:character])

    respond_to do |format|
      if @character.save
        format.html { redirect_to([@campaign, @character], :notice => 'Character was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to([@campaign, @character], :notice => 'Character was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(campaign_characters_path(@campaign)) }
    end
  end
end
