class CharactersController < ApplicationController
  def index
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @character = Character.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def create
    @character = Character.new(params[:character])

    respond_to do |format|
      if @character.save
        format.html { redirect_to(@character, :notice => 'Character was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(@character, :notice => 'Character was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
    end
  end
end
