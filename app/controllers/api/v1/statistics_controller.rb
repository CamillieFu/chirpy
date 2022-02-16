class Api::V1::StatisticsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_statistic, only: [ :show, :update ]

  def index
    @statistics = policy_scope(Statistic)
  end

  def show
  end

  def update
    if @statistic.update(statistic_params)
      render :show
    else
      render_error
    end
  end

  def create
    @statistic = Statstatistic.new(statistic_params)
    @statistic.kid_id = current_user.kid.id
    authorize @statistic
    if @statistic.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_statistic
    @statistic = Statistic.find(params[:id])
    authorize @statistic  # For Pundit
  end

  def statistic_params
    params.require(:statistic).permit(:total_tweets, :angry_tweets, :sad_tweets, :fearful_tweets, :joyful_tweets, :analytical_tweets, :confident_tweets, :tentative_tweets, :kid_id)
  end

  def render_error
    render json: { errors: @statistic.errors.full_messages },
      status: :unprocessable_entity
  end
end
