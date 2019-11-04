class StudyGroupsController < ApplicationController
  def index
    @study_groups = StudyGroup.all
  end

  def show
    @study_group = StudyGroup.find(params[:id])
  end

  def new
  end

  def create
    course_id = params[:course_id]
    course = Course.find(course_id)
    study_group_params_1 = study_group_params
    study_group_params_1[:user_name] = current_user.name
    study_group_params_1[:course_code] = course.course_code
    study_group_params_1[:course_id] = course_id
    @study_group = StudyGroup.new(study_group_params_1)

    @study_group.save
    if @study_group.save
      flash[:notice] = "Success"
      redirect_to :action => "show", :id => @study_group.id
    else
      flash[:alert] = "uh oh"
      redirect_to course_study_groups_path
    end

  end

  private
  def study_group_params
    params.require(:study_group).permit(:event_name, :time, :location, :description)
  end
end
