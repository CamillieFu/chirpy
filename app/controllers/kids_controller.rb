class KidsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @kid = Kid.new(kid_params)
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :birthday, :age, :ethnicity, :sexual_orientation, :gender_identity)
  end
end
