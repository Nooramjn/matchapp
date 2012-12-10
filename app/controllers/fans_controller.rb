class FansController < ApplicationController
before_filter :signed_in_fan, only: [:index,:edit, :update]
before_filter :correct_fan, only: [:edit, :update]
before_filter :admin_fan, only: :destroy

  # GET /fans
  # GET /fans.json
  def index
    @title = "Fans"
    @fans = Fan.all
    #in case I have pagination I will add it
    #@users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fans }
    end
  end

  # GET /fans/1
  # GET /fans/1.json
  def show
    @fan = Fan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fan }
    end
  end

  # GET /fans/new
  # GET /fans/new.json
  def new
    @fan = Fan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fan }
    end
  end

  # GET /fans/1/edit
  def edit
    @fan = Fan.find(params[:id])
  end

  # POST /fans
  # POST /fans.json
  def create
    @fan = Fan.new(params[:fan])

    respond_to do |format|
      if @fan.save
        sign_in @fan
        format.html { redirect_to @fan, notice: 'Welcome!' }
        format.json { render json: @fan, status: :created, location: @fan }
      else
        format.html { render action: "new" }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fans/1
  # PUT /fans/1.json
  def update
    @fan = Fan.find(params[:id])

    respond_to do |format|
      if @fan.update_attributes(params[:fan])
        format.html { redirect_to @fan, notice: 'Fan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fans/1
  # DELETE /fans/1.json
  def destroy
    @fan = Fan.find(params[:id])
    @fan.destroy
    #9.46
    flash[:success] = "User destroyed."
    respond_to do |format|
      format.html { redirect_to fans_url }
      format.json { head :no_content }
    end
  end
  
  private

    def signed_in_fan
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def correct_fan
      @fan = Fan.find(params[:id])
      redirect_to(root_path) unless current_fan?(@fan)
    end
    
    def admin_fan
      redirect_to(root_path) unless current_fan.admin?
    end
end
