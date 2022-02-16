class Api::V1::StatisticsController < Api::V1::BaseController
  before_action :set_statistic, only: [ :show ]

  def index
    @statistics = policy_scope(Statistic)
  end

  def show
  end

  private

  def set_statistic
    @statistic = Statistic.find(params[:id])
    authorize @statistic  # For Pundit
  end
end
