class MeetingsController < PublicController
  layout :choose_layout
  before_filter :check_states, :only => :index
    expose(:meetings){
      meetings = Meeting.where(:meeting_time => Date.today..Date.today + 7.days)
      if meetings.nil?
        meetings = []
      end
      unless check_states.empty?
        meetings = meetings.where(:state => check_states)
      end
      meetings.order("meeting_time ASC")
    }
    expose(:meeting){ Meeting.find(params[:id]) }

    expose(:meetings_count){
      meetings = Meeting.where(:meeting_time => Date.today..Date.today + 7.days)
    }


  def choose_layout
    'public/default'
  end
  private
  def check_states
    states_selected = []
    us_states.each do |state|
      if params[:meeting][state[1].to_sym] == "1"
        states_selected << state[1]
      end
    end
    states_selected
  end
end

