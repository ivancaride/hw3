class PlacesController < ApplicationController

  def index
    # find all Place rows
    @places = Place.all
  end

  def show
    @place = Place.find_by({"id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  def new
      @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
  #save place row
    @place.save
  #redirect user
    redirect_to "/places"
  end

  def edit
    #find a place
      @place = Place.find_by({ "id" => params["id"] })
    #render view with edit place form
  end
    
  def update
    #find a place
    @place = Place.find_by({ "id" => params["id"] })
    #assign user-entered form data to place's columns  
    @place["name"] = params["place"]["name"]
      
    #   # save place row
    @place.save
    #   # redirect user
    redirect_to "/places"
  end
    
  def destroy
    #   # find a place
    @place = Place.find_by({ "id" => params["id"] })
        # destroy place row
    @place.destroy
    #   # redirect user
    redirect_to "/places"
  end    
  
end
