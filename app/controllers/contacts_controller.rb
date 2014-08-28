class ContactsController < PublicController
  layout :choose_layout
  expose(:contact){Contact.new}

  def create
    if c = Contact.create(contact_params)
      flash[:notice] = t(:email_campaing_was_successfully_created)
      ContactMailer.new_contact(c.id).deliver
      redirect_to root_path
    else
      render :new
    end
  end
  def choose_layout
    'public/default'
  end

  private
    def contact_params
      params.require(:contact).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :message,
        :response_message,
      )
    end
end

