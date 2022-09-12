# frozen_string_literal: true
  module DailyDiets
  class MealsController < ApplicationController

    def show
      @meal = find_meal
    end

    def create
      @diet = find_diet
      @meal = @diet.meals.new(meal_params)
      if @meal.save
        redirect_to root_path, notice: t('.success')
      else
        flash.now[:alert] = t('.fail')
        render :new
      end
    end

    def edit
      @meal = Meal.find(params[:id])
    end

    def update
      @meal = find_meal
      if @meal.update(meal_params)
        redirect_to meals_path, notice: t('.success')
      else
        flash.now[:alert] = t('.fail')
        render :edit
      end
    end

    def delete
      @meal = find_meal
      if @meal.destroy
        redirect_to meals_path, notice: t('.success')
      else
        redirect_to meal_path(@meal), alert: t('.fail')
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
