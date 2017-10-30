class AuthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = {
        uid: request.env["omniauth.auth"].uid,
        email: request.env["omniauth.auth"].info.email,
        name: request.env["omniauth.auth"].info.name,
    }

    @user = user_facebook_login auth

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  def user_facebook_login auth
    user = User.where(provider: 'facebook', uid: auth[:uid]).first

    unless user
      user = User.new

      user.role = :common
    end

    user.email = auth[:email]
    user.name = auth[:name]
    user.password = Devise.friendly_token[0, 20]
    user.image = sprintf 'https://graph.facebook.com/%s/picture?height=500', auth[:uid]

    if user.save
      user
    end
  end

  def app_login
    user = User.where(provider: 'facebook', uid: params[:uid]).first_or_create do |user|
      user.email = params[:email]
      user.name = params[:name]
      user.password = Devise.friendly_token[0, 20]
      user.image = params[:image]
    end

    respond_to do |format|
      format.json {render json: user}
    end
  end

  def after_sign_in_path_for resource
    events_path
  end

  def failure
    redirect_to root_path
  end
end
