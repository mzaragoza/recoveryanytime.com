class ContactsController < PublicController
  layout :choose_layout

  def choose_layout
    'public/default'
  end
end

