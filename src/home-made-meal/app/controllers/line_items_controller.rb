class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]
  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    # here we use the param object to get the :food_item_id parameter from the current request 
    food_item = FoodItem.find(params[:food_item_id])
    # here we use @cart to make reletion between line_item and food_item to biuld a food item 
    @line_item = @cart.add_food_item(food_item)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_path, notice: "The item has been added to your cart." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.cart, notice: "Item has been removed" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:food_item_id)
    end
end
