class KidsController < ApplicationController
  before_action :set_kid, only: %i[show edit update destroy]
  def show
    authorize @kid
  end

  def create
    @kid = Kid.new(kid_params)
    authorize @kid
    @kid.dictionary = Dictionary.new
    @kid.user = current_user
    if @kid.save
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def new
    @kid = Kid.new
    authorize @kid
  end

  def edit
    authorize @kid
  end

  def update
    authorize @kid
    @kid.update(kid_params)
    if @kid.save
      redirect_to kid_path(@kid)
    else
      render :edit
    end
  end

  def destroy
    authorize @kid
    @kid.destroy
    flash[:remove] = "Successfully deleted"

    redirect_to dashboards_path
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :birthday, :age, :ethnicity, :sexual_orientation, :gender_identity)
  end

  def set_kid
    @kid = Kid.find(params[:id])
  end
end
