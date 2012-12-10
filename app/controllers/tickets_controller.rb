class TicketsController < ApplicationController
  before_filter :signed_in_fan, only: [:index,:edit, :update]
  before_filter :correct_fan,   only: [:edit, :update]
  # GET /tickets
  # GET /tickets.json
  def index
    @title = "Tickets"
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @matches = Match.all
    @title = "New Ticket"
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
        @matches = Match.all

    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
        @matches = Match.all

    @ticket = current_fan.tickets.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end


private

      def signed_in_fan
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def correct_fan
      #@fan = Fan.find(params[:id])
      #puts @fan.id
      puts @current_fan.id
      @ticket = Ticket.find(params[:id])
      puts @ticket.fan_id

      redirect_to(root_path) unless (@current_fan.id == @ticket.fan_id) || current_fan.admin
      #current_fan?(@fan) || current_fan.admin
    end
    
    def admin_fan
      redirect_to(root_path) unless current_fan.admin
    end


end
