class Admins::FacilitiesController < AdminController
  expose(:facilities){ Facility.order("type_of ASC, id DESC").scoped{} }
  expose(:facility, attributes: :facility_params)

  def create
   if facility.save
     flash[:notice] = t(:facility_was_successfully_created)
     redirect_to(admins_facilities_path)
   else
     render :new
   end
  end

  def update
    if facility.save
      flash[:notice] = t(:facility_was_successfully_updated)
      redirect_to(admins_facilities_path)
    else
      render :edit
    end
  end

  private

  def facility_params
    params.require(:facility).permit(
      :active,
      :address,
      :city,
      :contact_email,
      :contact_name,
      :contact_phone,
      :description,
      :image,
      :link,
      :main,
      :name,
      :position,
      :short_description,
      :state,
      :type_of,
      :zip,
    )
  end
end




