class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def login_XXX
    user = User.find_by_mobile(params[:mobile])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json:{success: true, message: 'Logged in!', status:201,id:user.id}
    else
      render json:{success: false,message:"Mobile No. or password is invalid", status: 406}
    end
  end


  def login
    #command = AuthenticateUser.call(params[:mobile], params[:password])
    user = User.find_by_mobile(params[:mobile])
    if user && command =user.authenticate(params[:password])
    session[:user_id] = command.id
     render json: { auth_token: command ,id:command.id}
   else
     render json: { error: command.errors }, status: :unauthorized
   end
  end

  def logout
    session[:user_id] = nil
    render json:{success: true, message: '"Logged out!"', status:201}
  end

    # create survey
    def create_survey
        @survey = Suggestion.new(survey_params)
        @survey.user_id = current_user.id
        if @survey.save
            render json: {success: true, message: 'created successfully', status: 201}
        else
            render json: {success: false, errors: @survey.errors.full_messages, status: 406}
      end
    end

    protected

	def survey_params
	    params.permit(:name, :email,:mobile,:problem)
	end

end
