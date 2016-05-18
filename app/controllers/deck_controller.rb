class DeckController < ApplicationController
  def edit
  end

  def show
    @jobs = Job.all
    #if user id matches the user id on session and job
    # @company = Company.all

    @events = Event.all
    # @event_type = EventType.all
    @contacts = Contact.all
    @note = Note.all
  end

  def new
    @job = Job.create params[:job,:job_position,:apply_date,:job_description_url,:company_name,:department,:user_id,:comp_value,:comp_type,:relocation,:name,:phone,:email,:note_id]
    redirect_to dashboard_path
  end

  private
  def job_params
    params.require(:job).permit(:job_position, :apply_date, :job_description_url, :company_name, :department, :comp_value, :comp_type, :relocation, :name, :phone, :email, :user_id, :event_type, :event_title, :note_id)
  end


  def new
  end

end
