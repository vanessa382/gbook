class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_gbook
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = @gbook.assignments.create(assignment_params)
    @category = Category.find(@assignment.category_id)
    @category.assignments.push(@assignment)
    @assignment.gbook_id = @gbook.id
    if @assignment.save
      redirect_to gbook_assignment_path(@gbook,@assignment)
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to gbook_assignments_path, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to gbook_assignments_path, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def set_gbook
      @gbook = Gbook.find(params[:gbook_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :point_total, :category_id)
    end
end