class MeetingsController < ApplicationController
  before_action :set_institution
  before_action :set_grade
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = @grade.meetings.all
    
    respond_with(@institution, @grade, @meetings)
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    respond_with(@institution, @grade, @meeting)
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @grade.people.each do |person|
      @meeting.attendances.build(person: person)
    end
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = @grade.meetings.new(meeting_params)
    @meeting.save

    respond_with(@institution, @grade, @meeting)
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @meeting.update(meeting_params)
    
    respond_with(@institution, @grade, @meeting)
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    
    respond_with(@institution, @grade, @meeting)
  end

  private
    
    def set_grade
      @grade = @institution.grades.find(params[:grade_id])
    end
     
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = @grade.meetings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:date, attendances_attributes: [:id, :person_id, :present])
    end
end
