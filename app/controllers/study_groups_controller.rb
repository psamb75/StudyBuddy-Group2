class StudyGroupsController < ApplicationController
  def index
    course = Course.find(params[:course_id])
    @study_groups = course.study_groups
  end

  def show
    @study_group = StudyGroup.find(params[:id])
    @attendees = @study_group.attendees
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
      flash[:error] = @study_group.errors.full_messages
      render 'new'
    end

  end

  def attend
    course_id = params[:course_id]
    study_group_id = params[:study_group_id]
    study_group = StudyGroup.find(study_group_id)
    @attendee = Attendee.new(event_name: study_group.event_name, user_name: current_user.name, user_id: current_user.id, study_group_id:study_group_id)

    @attendee.save
    redirect_to :action => "show", :id => study_group_id
  end

  def unattend
    course_id = params[:course_id]
    study_group_id = params[:study_group_id]
    study_group = StudyGroup.find(study_group_id)

    @attendee = Attendee.where(study_group_id: study_group_id, user_id: current_user.id)
    @attendee.where(study_group_id: study_group_id, user_id: current_user.id).destroy_all

    redirect_to :action => "show", :id => study_group_id
  end

  def unattend_from_dash
    course_id = params[:course_id]
    study_group_id = params[:study_group_id]
    study_group = StudyGroup.find(study_group_id)

    @attendee = Attendee.where(study_group_id: study_group_id, user_id: current_user.id)
    @attendee.where(study_group_id: study_group_id, user_id: current_user.id).destroy_all

    redirect_to :controller => "dashboard", :action => "index"
  end

  private
  def study_group_params
    params.require(:study_group).permit(:event_name, :time, :location, :description)
  end
end
