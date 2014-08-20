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
      :type_of,
      :name,
      :address,
      :city,
      :state,
      :zip,
      :description,
      :contact_name,
      :contact_email,
      :contact_phone,
      :image,
      :active,
      :link,
      :main,
      :position,
    )
  end
end




