class DirectorysController < PublicController
  layout :choose_layout
  before_filter :check_states, :only => :index

    expose(:facilities){
      if params[:facility][:facility]
        facility_type = params[:facility][:facility].downcase
      else
        facility_type = 'treatment'
      end
      if facility_type == 'treatment'
       facilities = Facility.is_active.treatment
      elsif facility_type == 'detox'
       facilities =  Facility.is_active.detox
      elsif facility_type == 'intensive outpatient'
       facilities =  Facility.is_active.intensive_outpatient
      elsif facility_type == 'sober living'
       facilities =  Facility.is_active.sober_living
      elsif facility_type == 'outpatient detox'
       facilities = Facility.is_active.outpatient_detox
      elsif facility_type == 'interventionists'
       facilities =  Facility.is_active.interventionists
      else
       facilities = Facility.is_active.treatment
      end
      if facilities.nil?
        facilities = []
      else
        unless check_states.empty?
          facilities = facilities.where(:state => check_states)
        end
        facilities.order("main DESC, position ASC")
      end
    }
    expose(:facilities_count){
      if params[:facility][:facility]
        facility_type = params[:facility][:facility].downcase
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
    expose(:facility){ Facility.is_active.find(params[:id]) }

    expose(:treatments){ Facility.is_active.treatment.order("main DESC, position ASC").limit(4) }
    expose(:detox){ Facility.is_active.detox.order("main DESC, position ASC").limit(4) }
    expose(:sober_living){ Facility.is_active.sober_living.order("main DESC, position ASC").limit(4) }
    expose(:intensive_outpatient){ Facility.is_active.intensive_outpatient.order("main DESC, position ASC").limit(4) }
    expose(:interventionists){ Facility.is_active.interventionists.order("main DESC, position ASC").limit(4) }
    expose(:outpatient_detox){ Facility.is_active.outpatient_detox.order("main DESC, position ASC").limit(4) }


    expose(:page_name){
      params[:facility][:facility].titleize
    }
  def choose_layout
    'public/default'
  end

  private
  def check_states
    states_selected = []
    us_states.each do |state|
      if params[:facility][state[1].to_sym] == "1"
        states_selected << state[1]
      end
    end
    states_selected
  end
end

