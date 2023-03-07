class OmniauthController < ApplicationController
    def facebook
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.create_from_provider_data(request.env['omniauth.auth'])

        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication
        else
            flash[:error] = 'Ops, impossibile fare accesso con facebook. Riprovare più tardi'
            redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        if @user = User.create_from_provider_data(request.env['omniauth.auth'])
            cookies.delete :google_oauth2_approval_prompt
            sign_in_and_redirect @user
        else
            cookies[:google_oauth2_approval_prompt] = "force"
            flash[:error] = 'Ops, impossibile fare accesso con google. Riprovare più tardi'
            redirect_to new_user_registration_url
        end
    end

    def failure
        flash[:error] = 'Ops, impossibile fare accesso. Riprovare più tardi'
        redirect_to new_user_registration_url
    end
end
