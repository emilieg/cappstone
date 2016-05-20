class DeckController < ApplicationController
  before_action :is_authenticated?

  def index

  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(params.require(:job).permit(:position,:apply_date, :job_description_url, :company_name, :department, :comp_value, :comp_type, :relocation, :address, :user_id, :company_id, :created_at, :updated_at))
    redirect_to dashboard_path
    # @contact = Contact.find(contact_params[:id])
    # @contact.update_attributes(params.require(:contact).permit(:name, :title, :phone, :email, :linkedin))
  end

  def updateContacts
    @contact = Contact.find(params[:id])
  end

  def addNote
    @note = Note.create(note_params)
    @note.update_attributes(params.permit(:title,:content))
  end

  def show
    ### Placeholder users not tied to jobs, replace :position => "Front-end Developer" with :job_id
    @job = Job.find(params[:id])
    @company = Company.where(:company_id => @job.company_id)
    @note = Note.new
    @contact = Contact.new
    @notes = Note.where(:job_id => @job.id)
    @event = Event.new
    @events = Event.where(:job_id => @job.id)
    @contacts = Contact.where(:company_id => @job.company_id)

  end

  def edit
    @job = Job.find(params[:id])
    @contact = Contact.find(params[:id])
  end

  def new
    @job = Job.new
    @contact = Contact.new
  end

  def create
    company = Company.find_or_create_by(name: params[:company])

    @job = company.job.new(job_params)

    @job.save()

    @contact = Contact.new(contact_params)
    @contact.save()

    redirect_to deck_show
  end

#### Note Methods
  def new_note
    @note = Note.new
  end

  def create_note
    puts "params:", params
    @note = Note.create(params.require(:note).permit(:title,:content,:job_id))
    @note.save()
  end

  def new_contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.create(params.require(:contact).permit(:name, :title, :phone, :email,:linkedin))
    @contact.save()
  end


#### Event Methods
  def new_event
    @events = Event.new

  end

  def create_event
    @events = Event.create(params.require(:event).permit(:title,:description,:address,:job_id))
    redirect_to deck_show
  end

  private
  def job_params
    params.permit(:position,:apply_date, :job_description_url, :department, :comp_value, :comp_type, :relocation, :address, :user_id, :company_id, :created_at, :updated_at)
  end

  def contact_params
    params.permit(:name,:title,:phone,:email,:linkedin,:company_id,:created_at,:updated_at)
  end

  def note_params
    params.permit(:title,:content,:job_id,:created_at,:updated_at)
  end

end
