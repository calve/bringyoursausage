class BarbecueIngredientsController < ApplicationController
  before_action :set_barbecue_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /barbecue_ingredients
  # GET /barbecue_ingredients.json
  def index
    @barbecue_ingredients = BarbecueIngredient.all
  end

  # GET /barbecue_ingredients/1
  # GET /barbecue_ingredients/1.json
  def show
  end

  # GET /barbecue_ingredients/new
  def new
    @barbecue_ingredient = BarbecueIngredient.new
  end

  # GET /barbecue_ingredients/1/edit
  def edit
  end

  # POST /barbecue_ingredients
  # POST /barbecue_ingredients.json
  def create
    @barbecue_ingredient = BarbecueIngredient.new(barbecue_ingredient_params)

    respond_to do |format|
      if @barbecue_ingredient.save
        format.html { redirect_to @barbecue_ingredient, notice: 'Barbecue ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @barbecue_ingredient }
      else
        format.html { render :new }
        format.json { render json: @barbecue_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barbecue_ingredients/1
  # PATCH/PUT /barbecue_ingredients/1.json
  def update
    respond_to do |format|
      if @barbecue_ingredient.update(barbecue_ingredient_params)
        format.html { redirect_to @barbecue_ingredient, notice: 'Barbecue ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @barbecue_ingredient }
      else
        format.html { render :edit }
        format.json { render json: @barbecue_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barbecue_ingredients/1
  # DELETE /barbecue_ingredients/1.json
  def destroy
    @barbecue_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to barbecue_ingredients_url, notice: 'Barbecue ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barbecue_ingredient
      @barbecue_ingredient = BarbecueIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barbecue_ingredient_params
      params.require(:barbecue_ingredient).permit(:quantity, :barbecue_id, :ingredient_id)
    end
end
