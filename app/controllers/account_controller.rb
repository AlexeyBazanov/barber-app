class AccountController < ApplicationController

  before_action :authenticate_user!
  before_action :store_course_code, :perform_stored_course_code, only: :index

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

  def store_course_code
    if params[:course_code].present?
      session[:course_code] = params[:course_code]
    end
  end

  def perform_stored_course_code
    if session[:course_code].present?
      form = CourseAccessForm.new({user_id: current_user.id, access_key_body: session[:course_code]})
      if form.valid?
        form.activate_course!
        flash.now[:notice] = 'Курс успешно активирован!'
      end
      session.delete(:course_code)
    end
  end

  def course_access_form_params
    params.require(:course_access_form).permit(:access_key_body)
  end
end
