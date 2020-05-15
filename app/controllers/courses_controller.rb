class CoursesController < ApplicationController

  before_action :authenticate_user!, :load_course, :access_exists?

  def show
  end

  protected

  def load_course
    @course = Course.where(id: params[:id]).first
    redirect_to(account_path) if @course.nil?
  end

  def access_exists?
    unless current_user.access_keys.any? { |key| key.course_id == @course.id }
      redirect_to accout_path
    end
  end

end
