class LessonsController < ApplicationController

  before_action :authenticate_user!, :load_lesson, :access_exists?, :start_date_arrived?

  def show
  end

  protected

  def load_lesson
    @lesson = Lesson.where(id: params[:id]).first
    redirect_to(account_path) if @lesson.nil?
  end

  def access_exists?
    unless current_user.access_keys.any? { |key| key.course_id == @lesson.course.id }
      redirect_to accout_path
    end
  end

  def start_date_arrived?
    redirect_to courses_path(@lesson.course) if Date.today < @lesson.start_at
  end

end
