class SessionsController < Devise::SessionsController
  def respond_to_on_destroy
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to new_user_session_path, status: :see_other, notice: I18n.t('devise.sessions.signed_out') }
    end
  end
end