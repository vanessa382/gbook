class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :set_student
  before_action :set_assignment
  before_action :set_gbook, only: [:create, :update]

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = @assignment.grades.create(grade_params)
    @grade.student_id = @student.id
    
    if @grade.save
      redirect_to gbook_assignment_path(@gbook,@assignment)
    else
      render :new 
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to gbook_assignment_path(@gbook,@assignment), notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gbook
      @gbook = Gbook.find(params[:gbook_id])
    end
    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_assignment
      @assignment = Assignment.find(params[:assignment_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:score)
    end
end
