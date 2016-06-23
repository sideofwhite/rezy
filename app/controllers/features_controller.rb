class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /features
  # GET /features.json
  def index
    @rental = Rental.friendly.find(params[:rental_id])
    @features = Feature.all
  end

  # GET /features/1
  # GET /features/1.json
  def show
     @rental = Rental.friendly.find(params[:rental_id])
  end

  # GET /features/new
  def new
    @rental = Rental.friendly.find(params[:rental_id])
    @feature = Feature.new
  end

  # GET /features/1/edit
  def edit
   @rental = Rental.friendly.find(params[:rental_id])
  end

  # POST /features
  # POST /features.json
  def create
    @rental = Rental.friendly.find(params[:rental_id])
    @feature = @rental.create_feature(feature_params)

    respond_to do |format|
      if @feature.save
        format.html { redirect_to rental_path(@rental), notice: 'Feature was successfully created.' }
        format.json { render :show, status: :created, location: @feature }
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
     @rental = Rental.friendly.find(params[:rental_id])
   

    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to rental_path(@rental), notice: 'Feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @feature }
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to features_url, notice: 'Feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:bed, :bath, :rent, :available, :dishwasher, :washer_dryer, :hardwood, :deck, :air, :cat, :dog, :bbq, :title, :description, :new_kitchen, :neighbourhood, :rental_id, :year_lease, :sq_fee, :property_type, :furnished, :sq_feet, :deposit)
    end
end
