# frozen_string_literal: true

module DailyDiets
  class MealsController < ApplicationController
    def create
      @diet = find_diet
      @meal = @diet.meals.new(meal_params)
      if @meal.save
        redirect_to daily_diet_path(@diet), notice: t('.success')
        CalculateNutrientsJob.perform_async(@meal.id)
      else
        flash.now[:alert] = t('.fail')
        render :new
      end
    end

    def destroy
      @meal = find_meal
      authorize @meal
      diet = @meal.daily_diet
      if @meal.destroy
        redirect_to daily_diet_path(diet), notice: t('.success')
        ReduceNutrientsJob.perform_async(@meal.attributes)
      else
        redirect_to daily_diet_path(diet), alert: t('.fail')
      end
    end

    private

    def find_meal
      Meal.find(params[:id])
    end

    def find_diet
      DailyDiet.find(params[:daily_diet_id])
    end

    def meal_params
      params.require(:meal).permit([:meal])
    end
  end
end
