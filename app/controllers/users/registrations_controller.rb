# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    first_name = params[:user][:first_name]
    last_name = params[:user][:last_name]
    password = params[:user][:password]
    email = params[:user][:email]
    citizen_id = params[:user][:citizen_id]
    role = params[:user][:role]

    @new_user = User.create(first_name: first_name, last_name: last_name, password: password, email: email, citizen_id: citizen_id, role: role)

    res_owner_id = @new_user.id

    case @new_user.role
      when "student"
        puts "student!"

        @student_id = RoleResource.new(name: "StudentId", res_type: "string", res_value: params[:regStudentId])
        @new_user.role_resources << @student_id
      when "teacher"
        puts "teacher!"
        @teacher_id = RoleResource.create(name: "TeacherId", res_type: "string", res_value: params[:regTeacherId])
        @new_user.role_resources << @teacher_id
        @department = RoleResource.create(name: "Department", res_type: "string", res_value: params[:regDepartmentId])
        @new_user.role_resources << @department
      else
        puts "Nay!"
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    '/'
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
