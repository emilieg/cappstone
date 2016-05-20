class DeckController < ApplicationController
  before_action :is_authenticated?
  def index
  end
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(params.require(:job).permit(:position,:apply_date, :job_description_url, :company_name, :department, :comp_value, :comp_type, :relocation, :address, :user_id, :company_id, :created_at, :updated_at))
    redirect_to dashboard_path
  end
  def show
    ### Placeholder users not tied to jobs, replace :position => "Front-end Developer" with :job_id
    @job = Job.find(params[:id])
    @resumes = Resume.all()
    #if user id matches the user id on session and job
    # @company = Company.all
    # @events = Event.all
    # # @event_type = EventType.all
    # @contacts = Contact.all
    # @note = Note.all
  end
  def edit
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    @job.save()
    @note = Note.new(note_params)
    @note.save()
    @contact = Contact.new(contact_params)
    @contact.save()
    redirect_to dashboard_path
  end
  def add_to_deck
    @job = Job.find(params[:id])
    @job.resume_id = :resume_id 
    @job.update(resume_id: params[:resume_id])
    @resume = Resume.where(id: @job.resume_id)
    redirect_to :back
  end
  private
  def job_params
    params.permit(:position,:apply_date, :job_description_url, :company_name, :department, :comp_value, :comp_type, :relocation, :address, :user_id, :company_id, :created_at, :updated_at)
  end
  def contact_params
    params.permit(:name,:title,:phone,:email,:linkedin,:company_id,:created_at,:updated_at)
  end
  def note_params
    params.permit(:title,:content,:job_id,:created_at,:updated_at)
  end
end