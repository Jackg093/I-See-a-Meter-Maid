class HpSearchesController < ApplicationController
  before_action :set_hp_search, only: [:show, :edit, :update, :destroy]

  # GET /hp_searches
  # GET /hp_searches.json
  def index
    @hp_searches = HpSearch.all
  end

  # GET /hp_searches/1
  # GET /hp_searches/1.json
  def show
  end

  # GET /hp_searches/new
  def new
    @hp_search = HpSearch.new
  end

  # GET /hp_searches/1/edit
  def edit
  end

  # POST /hp_searches
  # POST /hp_searches.json
  def create
    @hp_search = HpSearch.new(hp_search_params)

    respond_to do |format|
      if @hp_search.save
        format.html { redirect_to @hp_search, notice: 'Hp search was successfully created.' }
        format.json { render :show, status: :created, location: @hp_search }
      else
        format.html { render :new }
        format.json { render json: @hp_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hp_searches/1
  # PATCH/PUT /hp_searches/1.json
  def update
    respond_to do |format|
      if @hp_search.update(hp_search_params)
        format.html { redirect_to @hp_search, notice: 'Hp search was successfully updated.' }
        format.json { render :show, status: :ok, location: @hp_search }
      else
        format.html { render :edit }
        format.json { render json: @hp_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hp_searches/1
  # DELETE /hp_searches/1.json
  def destroy
    @hp_search.destroy
    respond_to do |format|
      format.html { redirect_to hp_searches_url, notice: 'Hp search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hp_search
      @hp_search = HpSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hp_search_params
      params.require(:hp_search).permit(:name, :zipcode)
    end
end
