class DeckController < ApplicationController
  before_action :is_authenticated?

  def index

  end


  def edit
  end

  def show
    @jobs = Job.where(user_id: 2)
    #if user id matches the user id on session and job
    # @company = Company.all

    @events = Event.all
    # @event_type = EventType.all
    @contacts = Contact.all
    @note = Note.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save()

    redirect_to dashboard_path
  end

  private
  def job_params
    params.permit(:position,:apply_date, :job_description_url, :company_name, :department, :comp_value, :comp_type, :relocation, :name, :phone, :email, :user_id, :event_type, :event_title, :note_id)
  end




end
