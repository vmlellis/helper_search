class SearchBoxesController < ApplicationController
  before_action :set_search_box, only: [:show, :edit, :update, :destroy]

  # GET /search_boxes
  # GET /search_boxes.json
  def index
    @search_boxes = SearchBox.all
  end

  # GET /search_boxes/1
  # GET /search_boxes/1.json
  def show
  end

  # GET /search_boxes/new
  def new
    @search_box = SearchBox.new
  end

  # GET /search_boxes/1/edit
  def edit
  end

  # POST /search_boxes
  # POST /search_boxes.json
  def create
    @search_box = SearchBox.new(search_box_params)

    respond_to do |format|
      if @search_box.save
        format.html { redirect_to @search_box, notice: 'Search box was successfully created.' }
        format.json { render :show, status: :created, location: @search_box }
      else
        format.html { render :new }
        format.json { render json: @search_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_boxes/1
  # PATCH/PUT /search_boxes/1.json
  def update
    respond_to do |format|
      if @search_box.update(search_box_params)
        format.html { redirect_to @search_box, notice: 'Search box was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_box }
      else
        format.html { render :edit }
        format.json { render json: @search_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_boxes/1
  # DELETE /search_boxes/1.json
  def destroy
    @search_box.destroy
    respond_to do |format|
      format.html { redirect_to search_boxes_url, notice: 'Search box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_box
      @search_box = SearchBox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_box_params
      params.require(:search_box).permit(:text, :ip)
    end
end
