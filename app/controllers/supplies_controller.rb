class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit]

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = Supply.all
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET barbecue/1/supplies/new
  def new
    @barbecue = Barbecue.find params[:barbecue_id]
    @supply = Supply.new
    @contributions = Supply.where(supplies: {barbecue_id: @barbecue.id}).group(:ingredient_id).sum(:quantity)
  end

  # GET /supplies/1/edit
  def edit
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @ingredient = Ingredient.find_or_initialize_by(title: supply_params[:ingredient][:title])
    @supply = Supply.new(quantity: supply_params[:quantity], ingredient: @ingredient)
    @barbecue = Barbecue.find params[:barbecue_id]
    @supply.ingredient = @ingredient
    @supply.barbecue = @barbecue
    @supply.user = current_or_guest_user

    respond_to do |format|
      if @supply.save
        format.html { redirect_to @supply.barbecue, notice: 'Supply was successfully created.' }
        format.json { render :show, status: :created, location: @supply }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to @supply, notice: 'Supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply }
      else
        format.html { render :edit }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    barbecue = @supply.barbecue
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to barbecue_path(barbecue), notice: 'Supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params[:supply].permit(:quantity,:barbecue_id,:ingredient_id, ingredient: [:title])
    end
end
