class DeckController < ApplicationController
  def edit
  end

  def show
    @jobs = Job.all
    #if user id matches the user id on session and job
    # @company = Company.all
    # @event = Event.all
    # @event_type = EventType.all
    # @note = Note.all
  end

  def new
    Job.create
  end

  private
  def job_params
    params.require(:job).permit(:job_position,:company_name, :user_id, :event_type, :event_title, :note_id)
  end


  def new
  end

end
