ActiveAdmin.register Studytime do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :admin_user_id, :title, :day, :start_time, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:admin_user_id, :day, :start_time, :end_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
