class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @place = Place.find_by({ "id" => params["place_id"] })
    @post["place_id"] = @place["id"]
  #render posts/new view with new Post form
  end

  def create
  #start with a new Post
    @post = Post.new
  #assign user-entered form data to Post's columns
    @post["title"] = params["post"]["title"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["description"] = params["post"]["description"]

  #assign relationship between post and place
    @post["place_id"] = params["post"]["place_id"]

  #save Post row
    @post.save
  #redirect user (/#{@post["company_id"]}")
    redirect_to "/places/#{@post["place_id"]}"
  end
end

