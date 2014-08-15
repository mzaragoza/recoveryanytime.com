class Admins::FellowshipsController < AdminController
  expose(:fellowships){ Fellowship.order("name ASC").scoped{} }
  expose(:fellowship , attributes: :fellowship_params)

  def create
   if fellowship.save
     flash[:notice] = t(:fellowship_was_successfully_created)
     redirect_to(admins_fellowships_path)
   else
     render :new
   end
  end

  def update
    if fellowship.save
      flash[:notice] = t(:fellowship_was_successfully_updated)
      redirect_to(admins_fellowships_path)
    else
      render :edit
    end
  end

  private

  def fellowship_params
    params.require(:fellowship).permit(
      :name,
      :description,
      :active,
      :image,
    )
  end
end



