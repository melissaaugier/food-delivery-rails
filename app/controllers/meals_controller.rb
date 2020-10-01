class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
    @meal.user = current_user
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to meals_path
    else
      render :new
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    redirect_to meals_path
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    # no need for app/views/meals/destroy.html.erb
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price)
  end
end
