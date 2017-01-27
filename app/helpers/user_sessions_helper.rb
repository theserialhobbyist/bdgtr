module UserSessionsHelper
  def usersessions_params
    params.require(:user_id)
  end
end
