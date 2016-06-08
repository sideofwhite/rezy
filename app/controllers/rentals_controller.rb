class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]


  def listing
  @skip_header = true
  @rental = Rental.find(params[:id])
  end

  # GET /rentals
  # GET /rentals.json
  def index
  @dashboard = true
  @rentals = current_user.rentals.order('created_at desc')
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show

    @issues = @rental.issues.where(:open => true).order('created_at desc')
  end



  # GET /rentals/new
  def new
    @bottom = true 
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = current_user.rentals.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:address, :addressSecondary, :city, :postal, :province, :user_id, :image)
    end
end
