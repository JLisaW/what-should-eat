class FoodsController < ProtectedController
  before_action :set_mood, only: [:show, :update, :destroy]

  # GET /foods
  def index
    # @moods = Mood.all
    @foods = current_user.foods.all

    render json: @foods
  end

  # GET /foods/1
  def show
    render json: @food
  end

  # POST /foods
  def create
    # @food = Food.new(food_params)
    @food = current_user.foods.build(food_params)

    if @food.save
      render json: @food, status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
  end

  private

  # Use callbacks to share common setup or onstraints between actions.
  def set_food
    # @food = Food.find(params[:id])
    @mood = current_user.foods.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def food_params
    params.require(:food).permit(:title, :food, :mood)
  end
end