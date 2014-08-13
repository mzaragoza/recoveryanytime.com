class Admins::EmailCampaingsController < AdminController
  expose(:email_campaings){ EmailCampaing.order("name ASC").scoped{} }
  expose(:email_campaing, attributes: :email_campaing_params)

  after_filter :create_mail_chimp_list

  def create
    if email_campaing.save
      flash[:notice] = t(:email_campaing_was_successfully_created)
      redirect_to admins_email_campaings_path
    else
      render :new
    end
  end
  def update
    if email_campaing.save
      flash[:notice] = t(:email_campaing_was_successfully_updated)
      redirect_to admins_email_campaings_path
    else
      render :edit
    end
  end


  private

  def create_mail_chimp_list

  end
  def email_campaing_params
    params.require(:email_campaing).permit(
      :name,
      :list_id,
      :active,
    )
  end
end


