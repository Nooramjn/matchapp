class OpponentsController < ApplicationController
  before_filter :signed_in_fan, only: [:edit, :update]
  before_filter :correct_fan,   only: [:edit, :update]

  # GET /opponents
  # GET /opponents.json
  def index
    @title = "Opponents"
    @opponents = Opponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @opponents }
    end
  end

  # GET /opponents/1
  # GET /opponents/1.json
  def show
    @opponent = Opponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @opponent }
    end
  end

  # GET /opponents/new
  # GET /opponents/new.json
  def new
    @opponent = Opponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @opponent }
    end
  end

  # GET /opponents/1/edit
  def edit
    @opponent = Opponent.find(params[:id])
  end

  # POST /opponents
  # POST /opponents.json
  def create
    @opponent = Opponent.new(params[:opponent])

    respond_to do |format|
      if @opponent.save
        format.html { redirect_to @opponent, notice: 'Opponent was successfully created.' }
        format.json { render json: @opponent, status: :created, location: @opponent }
      else
        format.html { render action: "new" }
        format.json { render json: @opponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /opponents/1
  # PUT /opponents/1.json
  def update
    @opponent = Opponent.find(params[:id])

    respond_to do |format|
      if @opponent.update_attributes(params[:opponent])
        format.html { redirect_to @opponent, notice: 'Opponent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @opponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opponents/1
  # DELETE /opponents/1.json
  def destroy
    @opponent = Opponent.find(params[:id])
    @opponent.destroy

    respond_to do |format|
      format.html { redirect_to opponents_url }
      format.json { head :no_content }
    end
  end
private

      def signed_in_fan
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def correct_fan
      @fan = Fan.find(params[:id])
      redirect_to(root_path) unless current_fan?(@fan) || current_fan.admin
    end
    
    def admin_fan
      redirect_to(root_path) unless current_fan.admin
    end


  
end
