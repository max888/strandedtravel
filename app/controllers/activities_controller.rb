class ActivitiesController < ApplicationController
  load_and_authorize_resource
  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new(destination_id: params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])
    @activity.user = current_user
    @destination = Destination.where(:id => @activity.destination_id).first

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @destination, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end



  def vote_up
    @activity = Activity.find(params[:id])
    @destination = Destination.where(:id => @activity.destination_id).first
    begin
      current_user.vote_for(@activity)
      respond_to do |format|
        format.html { redirect_to @destination }
        format.json { render json: {} }
      end
      
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

  def vote_down
    @activity = Activity.find(params[:id])
    @destination = Destination.where(:id => @activity.destination_id).first

    begin
      current_user.vote_against(@activity)
      redirect_to @destination, notice: "you disliked #{@activity.name}" 
      
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end

  end

  def remove_vote
    @activity = Activity.find(params[:id])
    @destination = Destination.where(:id => @activity.destination_id).first
    begin
      current_user.unvote_for(@activity)
      redirect_to @destination, notice: "you liked #{@activity.name}" 
      
      rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

end












