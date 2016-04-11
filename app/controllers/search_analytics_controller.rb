class SearchAnalyticsController < ApplicationController
  before_action :set_search_analytic, only: [:show, :edit, :update, :destroy]

  # GET /search_analytics
  def index
    @search_analytics = SearchAnalytic.all
  end

  # GET /search_analytics/1
  def show
  end

  # GET /search_analytics/new
  def new
    @search_analytic = SearchAnalytic.new
  end

  # GET /search_analytics/1/edit
  def edit
  end

  # POST /search_analytics
  def create
    @search_analytic = SearchAnalytic.new(search_analytic_params)

    if @search_analytic.save
      redirect_to @search_analytic, notice: 'Search analytic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /search_analytics/1
  def update
    if @search_analytic.update(search_analytic_params)
      redirect_to @search_analytic, notice: 'Search analytic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /search_analytics/1
  def destroy
    @search_analytic.destroy
    redirect_to search_analytics_url, notice: 'Search analytic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_analytic
      @search_analytic = SearchAnalytic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def search_analytic_params
      params.require(:search_analytic).permit(:text, :count)
    end
end
