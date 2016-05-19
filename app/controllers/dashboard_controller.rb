class DashboardController < ApplicationController
  #dashboard will show a list of jobs under that user
  #future: remove old jobs from this list (make inactive?)
  # before_action :is_authenticated?


  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'
  require 'net/http'
  require 'fileutils'

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'cappstone'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                               "cappstone.yaml")
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR
  ###  AUTH_CALENDAR instead of read-only
  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
    user_id = 'a'
    credentials = authorizer.get_credentials(user_id)

    if credentials.nil?
      url = authorizer.get_authorization_url(
        base_url: OOB_URI)
      puts "Open the following URL in the browser and enter the " +
           "resulting code after authorization"
      puts url
      # need to change from gets which requires user input to grab the code from oauth process
      code = gets
      # code = access_token
      puts code
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI)
    end

    credentials
  end




  def show
    @jobs = Job.all
    @job = Job.where(user_id: 2)
    @company = Company.all

    # Initialize the API
    # service = Google::Apis::CalendarV3::CalendarService.new
    # service.client_options.application_name = APPLICATION_NAME
    # service.authorization = authorize
    # credentials = :user_id

    # Fetch the next 10 events for the user
    calendar_id = 'primary'
    @response = service.list_events(calendar_id,
                                   max_results: 10,
                                   single_events: true,
                                   order_by: 'startTime',
                                   time_min: Time.now.iso8601)

      ###  Writes results to console ###
    #   puts @response.summary
    #   puts "Upcoming events:"
    #   puts "No upcoming events found" if @response.items.empty?
    #   ### This is the data that the controller would need to return and pass into views
    #   @result = @response.items
    #   @response.items.each do |event|
    #   @start = event.start.date
    #   @time = event.start.date_time
    #   @appointment = event.summary
    #   puts "- #{event.summary} (#{@start})"
    #   puts "-#{event.start.date}"
    # end
  end

  def new
     @job = Job.new
  end


  private
  def job_params
    params.require(:job).permit(:job_position,:company_name, :user_id)
  end







end
