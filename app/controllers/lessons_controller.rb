class LessonsController < ApplicationController

  before_action :authenticate_user!, :load_lesson, :access_exists?, :start_date_arrived?, :access_key_not_expired?

  def show
  end

  protected

  def load_lesson
    @lesson = Lesson.where(id: params[:id]).first
    redirect_to(account_path) if @lesson.nil?
  end

  def access_exists?
    unless current_user.access_keys.any? { |key| key.course_id == @lesson.course.id }
      redirect_to account_path
    end
  end

  def start_date_arrived?
    redirect_to courses_path(@lesson.course) if Date.today < @lesson.start_at
  end

  def access_key_not_expired?
    access_key = current_user.access_keys.detect { |key| key.course_id == @lesson.course.id }
    if access_key.nil? || (access_key.expiration_date.present? && access_key.expiration_date < @lesson.start_at)
      flash[:alert] = 'Доступ к уроку закрыт. Оплатите оставшуюся часть курса для просмотра оставшихся занятий!'
      redirect_to courses_path(@lesson.course)
    end
  end

end
