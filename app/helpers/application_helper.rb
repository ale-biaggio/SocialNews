module ApplicationHelper
    include Pagy::Frontend
end
def show_navbar?
    (controller_name == 'posts' && ['index', 'feed', 'maps','show_favorite'].include?(action_name)) ||
    (controller_name == 'users' && ['show', 'index'].include?(action_name)) ||
    (controller_name == 'user_reports' && action_name == 'new') ||
    (controller_name == 'devise/sessions' && action_name == 'new') ||
    (controller_name == 'devise/registrations' && action_name == 'new')
  end