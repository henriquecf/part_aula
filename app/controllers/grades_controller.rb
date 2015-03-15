class GradesController < ApplicationController
  before_action :set_institution
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @grades = @institution.grades.all
    
    respond_with(@institution, @grades)
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    respond_with(@institution, @grade)
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
    @grade = @institution.grades.create(grade_params)
    
    respond_with(@institution, @grade)
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    @grade.update(grade_params)
    
    respond_with(@institution, @grade)
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy

    respond_with(@institution, @grade)
  end

  private
    def set_institution
      @institution = Institution.find(params[:institution_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = @institution.grades.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :year)
    end
end
