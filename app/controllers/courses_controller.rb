class CoursesController < ApplicationController
  load_and_authorize_resource :except => [:vote]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.sort_by_votes.page(params[:page]).per(10)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # GET /courses/:id/vote
  def vote
    authorize! :vote, Course
    @course = Course.find(params[:id])
    @vote = Vote.new(:course => @course, :user => current_user)

    respond_to do |format|
      if !@course.user_has_voted?(current_user)
        if @vote.save
          format.html { redirect_to @course, notice: 'Your vote was successful. Thank you!' }
        else
          format.html { redirect_to @course, notice: 'Your vote was unsuccessful. Try again.' }
        end
      else
        format.html { redirect_to @course, notice: 'You are not allowed to vote for this course more than once.' }
      end
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user = current_user

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :minimum_class_size, :maximum_class_size, :proposal_id)
    end
end
