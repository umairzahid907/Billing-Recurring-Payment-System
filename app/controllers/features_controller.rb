# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_feature, only: %i[show edit update destroy]
  before_action :set_plan

  def index
    @features = @plan.features.all
  end

  def show; end

  def new
    authorize Feature
    @feature = @plan.features.new
  end

  def edit
    authorize @feature
  end

  def create
    authorize Feature
    @feature = @plan.features.new(feature_params)
    if @feature.save
      redirect_to plan_url(@plan), notice: 'Feature was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @feature
    if @feature.update(feature_params)
      redirect_to plan_url(@plan), notice: 'Feature was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @feature
    if @feature.destroy
      redirect_to plan_features_url, notice: 'Feature was successfully destroyed.'
    else
      redirect_to plan_feature_url(@feature), alert: 'Could not delete this feature.'
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :unit_price, :max_unit_limit, :plan_id)
  end
end
