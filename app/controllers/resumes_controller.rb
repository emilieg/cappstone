class ResumesController < ApplicationController
 before_action :current_user

  def index
  	@resumes = Resume.all
  end

  def new
  	@resume = Resume.new
  end

  def create
  	@resume = Resume.new(resume_params)
  	if @resume.save
         redirect_to resumes_path, notice: "Resume labeled #{@resume.name} has been uploaded."
      else
         render "new"
      end
  end

  def destroy
  	@resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to resumes_path, notice:  "Resume labeled #{@resume.name} has been deleted."
  end

  private
      def resume_params
      params.require(:resume).permit(:name, :attachment, :job_id)
   end
end
