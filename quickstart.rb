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

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'emiliegerberharris@gmail.com'
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
  puts credentials
  credentials
end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize


# Fetch the next 10 events for the user
calendar_id = 'primary'
response = service.list_events(calendar_id,
                               max_results: 10,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)

###  Writes results to console ###
puts response.summary
puts "Upcoming events:"
puts "No upcoming events found" if response.items.empty?
### This is the data that the controller would need to return and pass into views

response.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end

## This is adding a new calendar event - would require new controller
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
result = service.insert_event('primary', event)
puts "Event created: #{result.html_link}"
