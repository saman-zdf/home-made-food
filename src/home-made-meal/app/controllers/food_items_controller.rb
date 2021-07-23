class FoodItemsController < ApplicationController
  before_action :set_food_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /food_items or /food_items.json
  def index
    @food_items = FoodItem.all
  end

  # GET /food_items/1 or /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    # in the new action we check if the user is signed in and if the user has created profile it should take use to the new fooditem page to create a new food for sell, if user doesn't have a profile it will take use to the new profile to create a profile and then it will take use to new fooditem, and if the user hasn't sifned in or create an account it will take the user to sign up page for singing up first 
    if user_signed_in?
      if current_user.profile
        @food_item = FoodItem.new
      else 
        new_profile_path
      end
        sign_up_path
    end
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /food_items or /food_items.json
  def create
    @food_item = FoodItem.new(food_item_params)
    # once the profile created we can assign the seller_id to the current_user.profile.id
    @food_item.seller_id = current_user.profile.id
    @food_item.profile_id = current_user.id

    respond_to do |format|
      if @food_item.save
        format.html { redirect_to @food_item, notice: "Food item was successfully created." }
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1 or /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to @food_item, notice: "Food item was successfully updated." }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1 or /food_items/1.json
  def destroy
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_to food_items_url, notice: "Food item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_item_params
      params.require(:food_item).permit(:name, :description, :availability, :food_type, :price, :buyer_id, :seller_id, :profile_id)
    end
end
