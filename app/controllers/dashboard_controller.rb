class DashboardController < ApplicationController
  #dashboard will show a list of jobs under that user
  #future: remove old jobs from this list (make inactive?)
  before_action :is_authenticated?
  


  def show
    @jobs = Job.all
    @job = Job.where(user_id: 2) 
    @company = Company.all
  end


  private
  def job_params
    params.require(:job).permit(:job_position,:company_name, :user_id)
  end




end
