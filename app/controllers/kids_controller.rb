class KidsController < ApplicationController
  before_action :set_kid, only: %i[show edit update destroy add remove]

  def show
    authorize @kid
    @dictionary = @kid.dictionary
    @words = @dictionary.words
  end

  def create
    @kid = Kid.new(kid_params)
    authorize @kid
    @kid.dictionary = Dictionary.new
    @kid.user = current_user
    if @kid.save
      redirect_to dashboards_path
    else
      flash.now[:alert] = "Sorry, child wasn't added"
      render "dashboards/index"
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
      flash[:alert] = "Details were not updated"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    authorize @kid
    @kid.destroy
    flash[:remove] = "Successfully deleted"

    redirect_to dashboards_path
  end

  def add
    word = params[:word]
    dictionary = @kid.dictionary
    words = dictionary.words
    words << word
    dictionary.save
    authorize @kid

    redirect_to kid_path(@kid)
  end

  def remove
    # will refactor later if I  have time to a dictionary controller?
    raise
    word = params[:word]
    dictionary = @kid.dictionary
    word = dictionary.words(word)
    word.delete
    dictionary.save
    authorize @kid
    redirect_to kid_path(@kid)
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :birthday, :age, :ethnicity, :sexual_orientation, :gender_identity)
  end

  def word_params
    params.require(:kid).permit(:word)
  end

  def set_kid
    @kid = Kid.find(params[:id])
  end
end
