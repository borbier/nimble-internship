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
    # super
    render plain: params[:user].inspect
    firstName = params[:user][:firstName]
    lastName = params[:user][:lastName]
    password = params[:user][:password]
    email = params[:user][:email]
    citizenId = params[:user][:citizenId]
    role = params[:user][:role]

    @new_user = User.create(firstName: firstName, lastName: lastName, password: password, email: email, citizenId: citizenId, role: role)

    res_owner_id = @new_user.id

    case @new_user.role
      when "student"
        puts "student!"

        @studentId = RoleResource.new(name: "StudentId", resType: "string", resValue: params[:regStudentId])
        @new_user.roleResources << @studentId
      when "teacher"
        puts "teacher!"
        @teacherId = RoleResource.create(name: "TeacherId", resType: "string", resValue: params[:regTeacherId])
        @new_user.roleResources << @teacherId
        @department = RoleResource.create(name: "Department", resType: "string", resValue: params[:regDepartmentId])
        @new_user.roleResources << @department
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
