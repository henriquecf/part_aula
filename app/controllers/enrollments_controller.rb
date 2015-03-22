class EnrollmentsController < ApplicationController
  before_action :set_institution
  before_action :set_person
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = @person.enrollments.all
    
    respond_with(@institution, @person, @enrollments)
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
    respond_with(@institution, @person, @enrollment)
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
    
    render :new, layout: false
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = @person.enrollments.new(enrollment_params)
    @enrollment.save

    respond_with(@institution, @person, @enrollment)
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    @enrollment.update(enrollment_params)
    
    respond_with(@institution, @person, @enrollment)
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    
    respond_with(@institution, @person, @enrollment)
  end

  private
    def set_person
      @person = @institution.people.find(params[:person_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = @person.enrollments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:role, :grade_id)
    end
end
