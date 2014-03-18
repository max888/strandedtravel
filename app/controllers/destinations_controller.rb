class DestinationsController < ApplicationController
  # before_filter :authenticate_user!  ##need this for omniauth?
  load_and_authorize_resource

  def index
    # @destinations = Destination.all
    @q = Destination.search(params[:q])
    @destinations = @q.result(:distinct => true).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    @destination = Destination.find(params[:id])
    @activities = Activity.where(destination_id: @destination.id).plusminus_tally.order('plusminus_tally DESC')
    @eats = @activities.where :category_id => 1
    @drinks = @activities.where :category_id => 2
    @sleeps = @activities.where :category_id => 3
    @explores = @activities.where :category_id => 4

    photo_data  = HTTParty.get("https://api.instagram.com/v1/tags/#{@destination.city}/media/recent?client_id=8f6d1dc952db409f8f2762cb354711fc")
    body = JSON.parse(photo_data.body)["data"]
    @images = body.map { |i| i["images"]["low_resolution"]["url"] }


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @destination }
    end
  end

  # GET /destinations/new
  # GET /destinations/new.json
  def new
    @destination = Destination.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @destination }
    end
  end

  # GET /destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(params[:destination])
    @destination.user = current_user

    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render json: @destination, status: :created, location: @destination }
      else
        format.html { render action: "new" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /destinations/1
  # PUT /destinations/1.json
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy

    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end
end
