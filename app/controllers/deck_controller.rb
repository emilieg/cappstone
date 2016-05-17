class DeckController < ApplicationController
  def edit
  end

  def show
    @jobs = Job.All
    #if user id matches the user id on session and job
    @company = Company.All
    @event = Event.All
    @event_type = EventType.All
    @note = Note.All
  end

  private
  def job_params
    params.require(:job).permit(:job_position,:company_name, :user_id, :event_type, :event_title, :note_id)
  end


  def new
  end

end
