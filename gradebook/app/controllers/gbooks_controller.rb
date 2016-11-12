class GbooksController < ApplicationController
  before_action :set_gbook, only: [:show, :edit,  :update, :destroy]

  # GET /gbooks
  # GET /gbooks.json
  def index
    @gbooks = Gbook.all
  end

  # GET /gbooks/1
  # GET /gbooks/1.json
  def show
  end

  # GET /gbooks/new
  def new
    @gbook = Gbook.new
  end

  # GET /gbooks/1/edit
  def edit
  end
 
  # POST /gbooks
  # POST /gbooks.json
  def create
    @gbook = Gbook.new(gbook_params)
    @gbook.save
    redirect_to @gbook
  end

  # PATCH/PUT /gbooks/1
  # PATCH/PUT /gbooks/1.json
  def update
    respond_to do |format|
      if @gbook.update(gbook_params)
        format.html { redirect_to @gbook, notice: 'Gbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @gbook }
      else
        format.html { render :edit }
        format.json { render json: @gbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gbooks/1
  # DELETE /gbooks/1.json
  def destroy
    @gbook.destroy
    respond_to do |format|
      format.html { redirect_to gbooks_url, notice: 'Gbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gbook
      @gbook = Gbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gbook_params
      params.fetch(:gbook, {})
    end
end
