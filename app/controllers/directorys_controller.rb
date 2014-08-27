class DirectorysController < PublicController
  layout :choose_layout


    expose(:facilities){
      if params[:facilty]
        facility_type = params[:facilty].downcase
      else
        facility_type = 'treatment'
      end
      if facility_type == 'treatment'
       facilities = Facility.is_active.treatment
      elsif facility_type == 'detox'
       facilities =  Facility.is_active.detox
      elsif facility_type == 'Intensive Outpatient'
       facilities =  Facility.is_active.intensive_outpatient
      elsif facility_type == 'Sober Living'
       facilities =  Facility.is_active.sober_living
      elsif facility_type == 'Outpatient Detox'
       facilities = Facility.is_active.outpatient_detox
      elsif facility_type == 'Interventionists'
       facilities =  Facility.is_active.interventionists
      else
       facilities = Facility.is_active.treatment
      end
      if facilities.nil?
        facilities = []
      else
        facilities.order("main DESC, position ASC")
      end
    }

    expose(:treatments){ Facility.is_active.treatment.order("main DESC, position ASC").limit(4) }
    expose(:detox){ Facility.is_active.detox.order("main DESC, position ASC").limit(4) }
    expose(:sober_living){ Facility.is_active.sober_living.order("main DESC, position ASC").limit(4) }
    expose(:intensive_outpatient){ Facility.is_active.intensive_outpatient.order("main DESC, position ASC").limit(4) }
    expose(:interventionists){ Facility.is_active.interventionists.order("main DESC, position ASC").limit(4) }
    expose(:outpatient_detox){ Facility.is_active.outpatient_detox.order("main DESC, position ASC").limit(4) }

  def choose_layout
    'public/default'
  end
end

