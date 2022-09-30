# frozen_string_literal: true

class DailyDietsController < ApplicationController
  def index
    @daily_diets = current_user.daily_diets.order('date desc')
  end

  def show
    @daily_diet = find_daily_diet
    authorize @daily_diet
    @meals = @daily_diet.meals
    @meal = @daily_diet.meals.build
  end

  def new
    @daily_diet = current_user.daily_diets.new
  end

  def create
    @daily_diet = current_user.daily_diets.new(daily_diet_params)
    if @daily_diet.save
      redirect_to daily_diets_path, notice: t('.success')
    else
      flash.now[:alert] = @daily_diet.errors.full_messages
      render :new
    end
  end

  def edit
    @daily_diet = DailyDiet.find(params[:id])
    authorize @daily_diet
  end

  def update
    @daily_diet = find_daily_diet
    authorize @daily_diet
    if @daily_diet.update(daily_diet_params)
      redirect_to daily_diets_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :edit
    end
  end

  def destroy
    @daily_diet = find_daily_diet
    authorize @daily_diet
    if @daily_diet.destroy
      redirect_to daily_diets_path, notice: t('.success'), status: :see_other
    else
      redirect_to daily_diet_path(@daily_diet), alert: t('.fail')
    end
  end

  private

  def find_daily_diet
    DailyDiet.find(params[:id])
  end

  def daily_diet_params
    params.require(:daily_diet).permit(%i[planned_calories date])
  end
end
