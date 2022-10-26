# frozen_string_literal: true

class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
     def google_oauth2
          admin = Person.from_omniauth(auth)

          if admin.present?
               sign_out_all_scopes
               flash[:success] = t('devise.omniauth_callbacks.success', kind: 'Google')
               sign_in_and_redirect(admin, event: :authentication)
          else
               flash[:alert] =
                    t('devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized.")
               redirect_to(new_person_session_path)
          end
     end

     protected

     # The path used when OmniAuth fails
     def after_omniauth_failure_path_for(_scope)
          new_person_session_path
     end

     def after_sign_in_path_for(resource_or_scope)
          stored_location_for(resource_or_scope) || root_path
     end

     private

     def auth
          @auth ||= request.env['omniauth.auth']
     end
end
