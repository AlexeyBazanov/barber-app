class AccountController < ApplicationController

  before_action :authenticate_user!

  def index
    @course_access_form = CourseAccessForm.new
  end

  def access_course
    @course_access_form = CourseAccessForm.new(course_access_form_params)
    @course_access_form.user_id = current_user.id

    if @course_access_form.valid?
      @course_access_form.activate_course!
      @course_access_form = CourseAccessForm.new
      flash.now[:notice] = 'Курс успешно активирован!'
    end

    render 'index'
  end

  protected

  def course_access_form_params
    params.require(:course_access_form).permit(:access_key_body)
  end
end
