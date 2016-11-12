class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_gbook
  
  def new
  end

  def show
  end
  
  def create
    @student = @gbook.students.create(student_params)
    @student.gbook_id = @gbook.id
    redirect_to gbook_students_path(@gbook)
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
    def set_gbook
      @gbook = Gbook.find(params[:gbook_id])
    end

    def student_params
      params[:student].permit(:name)
    end
end
