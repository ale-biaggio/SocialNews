module ApplicationHelper
    include Pagy::Frontend
end
def show_navbar?
    (controller_name == 'posts' && ['index', 'feed', 'maps'].include?(action_name)) ||
    (controller_name == 'users' && ['show', 'index'].include?(action_name))||
    (controller_name == 'user_reports' && action_name == 'new')
end