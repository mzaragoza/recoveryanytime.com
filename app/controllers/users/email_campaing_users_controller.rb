class Users::EmailCampaingUsersController < UserController
  expose(:user){ User.find(params[:id]) }
  expose(:email_campaing_user){ user }

  def edit
    if user != current_user
      # to do Email Managment that a user is trying to update another users info
      redirect_to users_profile_path(user)
    end
  end
  def update
    gb = Gibbon::API.new
    email_campaings.each do |ec|
      if params[:ec]["#{ec.id}"].to_s.empty?
        ecu = EmailCampaingUser.find_or_create_by_email_campaing_id_and_user_id(ec.id, current_user.id)
        ecu.opt_in = false
        ecu.save

        list_id = ecu.email_campaing.list_id
        email      = current_user.email.to_s
        in_list = false
        gb.lists.members({:id => list_id})['data'].each do |list|
        if list["email"] == email and list['status'] == 'unsubscribe'
          in_list = true
        end
        end
        if in_list == false
          gb.lists.unsubscribe(:id => list_id, :email => {:email => email}, :delete_member => false, :send_notify => true)
        end
      else
        ecu = EmailCampaingUser.find_or_create_by_email_campaing_id_and_user_id(ec.id, current_user.id)
        ecu.opt_in = true
        ecu.save
        list_id = ecu.email_campaing.list_id
        #gb.lists.members({:id => list_id})
        email      = current_user.email.to_s
        first_name = current_user.first_name.to_s
        last_name  = current_user.last_name.to_s
        info = gb.lists.member_info({:id => list_id, :emails => {:email => email} })
        in_list = false
        gb.lists.members({:id => list_id})['data'].each do |list|
          if list["email"] == email and list['status'] == 'subscribed'
            in_list = true
          end
        end
        if in_list == false
          gb.lists.subscribe({:id => list_id, :email => {:email => email}, :merge_vars => {:FNAME => first_name, :LNAME => last_name}, :double_optin => false})
        end
      end
    end
    flash[:notice] = t(:profile_was_successfully_updated)
    redirect_to users_profile_path(user)
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :active,
      :is_admin,
      :is_owner,
      :account_id,
      :first_name,
      :last_name,
      :phone,
      :photo
    )
  end
end

