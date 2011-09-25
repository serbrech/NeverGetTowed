# -*- coding: utf-8 -*-
class PlannedEventsController < ApplicationController


  # GET /planned_events_for_location
  # GET /planned_events_for_location.json
  def planned_events_for_location
    lat = params[:lat]
    lng = params[:lng]
    jsoncallback = params[:jsoncallback]

    @markers = [
      {
        :streetName => "Sporveisgata",
        :event => "Snømåking fra kl. 18:00 til kl. 19:00",
        :lat => "59.925152",
        :lng => "10.725403"
      },
      {
        :streetName => "Wessels gate",
        :event => "Snømåking fra kl. 18:00 til kl. 19:00",
        :lat => "59.919646",
        :lng => "10.741582"
      },
      {
        :streetName => "Nedre Slottsgate",
        :event => "Snømåking fra kl. 18:00 til kl. 19:00",
        :lat => "59.910460",
        :lng => "10.740981"
      }
    ]

    if(jsoncallback)then
      response = "#{jsoncallback}(#{@markers.to_json});"
      headers["Content-Type"] = "text/javascript; charset=utf-8"
      render(:text => response)
    else
      headers["Content-Type"] = "application/json; charset=utf-8"
      render :json => { :markers => @markers }
    end

  end

  # GET /planned_events
  # GET /planned_events.json
  def index
    @planned_events = PlannedEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planned_events }
    end
  end

  # GET /planned_events/1
  # GET /planned_events/1.json
  def show
    @planned_event = PlannedEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planned_event }
    end
  end

  # GET /planned_events/new
  # GET /planned_events/new.json
  def new
    @planned_event = PlannedEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planned_event }
    end
  end

  # GET /planned_events/1/edit
  def edit
    @planned_event = PlannedEvent.find(params[:id])
  end

  # POST /planned_events
  # POST /planned_events.json
  def create
    @planned_event = PlannedEvent.new(params[:planned_event])

    respond_to do |format|
      if @planned_event.save
        format.html { redirect_to @planned_event, notice: 'Planned event was successfully created.' }
        format.json { render json: @planned_event, status: :created, location: @planned_event }
      else
        format.html { render action: "new" }
        format.json { render json: @planned_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planned_events/1
  # PUT /planned_events/1.json
  def update
    @planned_event = PlannedEvent.find(params[:id])

    respond_to do |format|
      if @planned_event.update_attributes(params[:planned_event])
        format.html { redirect_to @planned_event, notice: 'Planned event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @planned_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_events/1
  # DELETE /planned_events/1.json
  def destroy
    @planned_event = PlannedEvent.find(params[:id])
    @planned_event.destroy

    respond_to do |format|
      format.html { redirect_to planned_events_url }
      format.json { head :ok }
    end
  end
end
