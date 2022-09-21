class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]

  # GET /plans or /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1 or /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans or /plans.json
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plan_url(@plan), notice: 'Plan was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    if @plan.update(post_params)
      redirect_to plan_url(@plan), notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1 or /plans/1.json
  def destroy

    if @plan.destroy
      redirect_to plans_url, notice: 'Plan was successfully destroyed.'
    else
      redirect_to plan_path(@plan), alert: 'Could not delete this plan.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:name, :monthly_fee, :user_id)
    end
end
