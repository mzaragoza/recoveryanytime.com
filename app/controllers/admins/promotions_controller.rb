class Admins::PromotionsController < AdminController
  expose(:promotions){ Promotion.order("id DESC").scoped{} }
  expose(:promotion, attributes: :promotion_params)

  def create
   if promotion.save
     flash[:notice] = t(:promotion_was_successfully_created)
     redirect_to(admins_promotions_path)
   else
     render :new
   end
  end

  def update
    if promotion.save
      flash[:notice] = t(:promotion_was_successfully_updated)
      redirect_to(admins_promotions_path)
    else
      render :edit
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(
      :name,
      :image,
      :link,
    )
  end
end



