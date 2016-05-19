class CalendarController < ApplicationController
  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'

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
    user_id = 'wwww'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(
        base_url: OOB_URI)
      puts "Open the following URL in the browser and enter the " +
           "resulting code after authorization"
      puts url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI)
    end
    credentials
end


  def api
    # Initialize the API
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize
    # credentials = :user_id
     
    
    # service.authorization = credentials    
    # Fetch the next 10 events for the user
    calendar_id = 'primary'
    @response = service.list_events(calendar_id,
                                   max_results: 10,
                                   single_events: true,
                                   order_by: 'startTime',
                                   time_min: Time.now.iso8601)

    ###  Writes results to console ###
      puts @response.summary
      puts "Upcoming events:"
      puts "No upcoming events found" if @response.items.empty?
      ### This is the data that the controller would need to return and pass into views
      @result = @response.items
      @response.items.each do |event|
      @start = event.start.date
      @time = event.start.date_time
      @appointment = event.summary
      puts "- #{event.summary} (#{@start})"
    end

  end

  def add
    event = Google::Apis::CalendarV3::Event.new(
    summary: 'Phone interview',
    location: '1234 5th Ave S, Seattle, WA',
    description: 'A call with Susie Johnson to discuss the front-end dev job',
    start: {
      date_time: '2016-05-16T15:00:00-07:00',
      time_zone: 'America/Los_Angeles',
    },
    end: {
      date_time: '2016-05-16T16:00:00-07:00',
      time_zone: 'America/Los_Angeles',
    },
    reminders: {
      use_default: true,
      # overrides: [
      #   {method: 'email', minutes: 24 * 60},
      #   {method: 'popup', minutes: 10},
      # ],
  },
)
    ### 'Primary' needs to be replaced with current_user email address
    result = service.insert_event(:email, event)
    puts "Event created: #{result.html_link}"
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end


