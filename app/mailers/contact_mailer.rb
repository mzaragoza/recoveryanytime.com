class ContactMailer < ActionMailer::Base
  layout 'email'
  def new_contact(contact_id)
    @contact = Contact.find(contact_id)
    subject = " New Contact Email from #{ @contact.name } -  Recovery Anytime"
    mail(
      :from => "Recovery Anytime<automated@recoveryanytime.com>",
      :to =>  ['staff@recoveryanytime.com'],
      :bcc => ["mzaragoza@circletechfl.com"],
      :reply_to => 'automated@recoveryanytime.com',
      :subject => subject
    )
  end
end
