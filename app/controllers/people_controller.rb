class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :relate_parent, :parent_search]
  before_action :set_institution

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    
    respond_with(@institution, @people)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    respond_with(@institution, @person)
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.institution = @institution
    @person.save
    
    respond_with(@institution, @person)
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person.update(person_params)
    
    respond_with(@institution, @person)
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    
    respond_with(@institution, @person)
  end
  
  def relate_parent
    @parent = Person.find(params[:parent_id])
    @person.parents << @parent
    
    respond_with(@institution, @person)
  end
  
  def parent_search
    @possible_parents = @institution.people.where("name LIKE '%#{@person.name.split(" ").last}'").exclude(@person)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end
    
    def set_institution
      @institution = Institution.find(params[:institution_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :gender, :email, :phone, :date_of_birth)
    end
end