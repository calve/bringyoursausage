class BarbecuesController < ApplicationController
  before_action :set_barbecue, only: [:show, :edit, :update, :destroy]
  require 'rqrcode'

  # GET /barbecues
  # GET /barbecues.json
  def index
    @barbecues = Barbecue.all
  end

  # GET /barbecues/1
  # GET /barbecues/1.json
  def show
    @attending_users = User.joins(:supply).where(supplies: {barbecue_id: @barbecue.id}).distinct
    # @contributions is an array associating ingredient_id to their total quantities
    @contributions = Supply.where(supplies: {barbecue_id: @barbecue.id}).group(:ingredient_id).sum(:quantity)
    @qr = RQRCode::QRCode.new(barbecue_url, :size => 7, :level => :l)
  end

  # GET /barbecues/new
  def new
    @barbecue = Barbecue.new
    3.times {
      @barbecue.barbecue_ingredient.build
      # Create fields for ingredients
      @barbecue.barbecue_ingredient.last.ingredient = Ingredient.new
    }
  end

  # GET /barbecues/1/edit
  def edit
    @barbecue.barbecue_ingredient.build  # Adds a field for an ingredient
    @barbecue.barbecue_ingredient.last.ingredient = Ingredient.new
  end

  # POST /barbecues
  # POST /barbecues.json
  def create
    @barbecue = Barbecue.new(barbecue_params)
    @barbecue.user = current_user
    create_ingredients

    respond_to do |format|
      if @barbecue.save
        format.html { redirect_to @barbecue, notice: 'Barbecue was successfully created.' }
        format.json { render :show, status: :created, location: @barbecue }
      else
        format.html { render :new }
        format.json { render json: @barbecue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barbecues/1
  # PATCH/PUT /barbecues/1.json
  def update
    create_ingredients

    respond_to do |format|
      if @barbecue.update(barbecue_params)
        format.html { redirect_to @barbecue, notice: 'Barbecue was successfully updated.' }
        format.json { render :show, status: :ok, location: @barbecue }
      else
        format.html { render :edit }
        format.json { render json: @barbecue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barbecues/1
  # DELETE /barbecues/1.json
  def destroy
    @barbecue.destroy
    respond_to do |format|
      format.html { redirect_to barbecues_url, notice: 'Barbecue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barbecue
      @barbecue = Barbecue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barbecue_params
      params.require(:barbecue)
        .permit(
                :title,
                :begin_date,
                barbecue_ingredient_attributes:
                [
                 :id,
                 :quantity,
                 :_destroy,
                 ingredient_attributes:
                 [
                  :id,
                  :title
                 ]
                ]
                )
    end

    def create_ingredients
      params[:barbecue][:barbecue_ingredient_attributes].each() do |index,local_params|
        logger.debug(local_params[:ingredient_attributes][:title])
        if local_params[:id]
          barbecue_ingredient = BarbecueIngredient.find(local_params[:id])
        else
          barbecue_ingredient = BarbecueIngredient.new()
        end
        barbecue_ingredient.ingredient = Ingredient.find_or_initialize_by(title: local_params[:ingredient_attributes][:title])
        barbecue_ingredient.barbecue = @barbecue
        barbecue_ingredient.quantity = local_params[:quantity]
        barbecue_ingredient.save
      end
    end
end
