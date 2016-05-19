
class DashboardController < ApplicationController
  #dashboard will show a list of jobs under that user
  #future: remove old jobs from this list (make inactive?)
  before_action :is_authenticated?

  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'
  require 'net/http'
  require 'fileutils'
  require 'rest-client'
  require 'net/http'
  require 'uri'

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'cappstone'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                               "cappstone.yaml")
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR

  def show
    @jobs = Job.all
    @job = Job.where(user_id: 2)
    @company = Company.all

    #Call API using session[:access_token] in the request HTTP header

    email = session[:email]
    timeMin = Time.now.iso8601
    maxResults = 10
    encoded_url = URI.encode('https://www.googleapis.com/calendar/v3/calendars/drewrudebusch@gmail.com/events?timeMin=2016-05-09T10:00:00-07:00')
    # url = URI.parse(encoded_url)

    # puts 'encoded URL'
    # puts encoded_url
    # puts 'unencoded URI'
    # puts url


    # uri = URI('https://www.googleapis.com/calendar/v3/calendars/drewrudebusch@gmail.com/events\?timeMin\=2016-05-01T10:00:00-07:00')

    # req = Net::HTTP::Get.new(uri)
    # req['Authorization'] = 'Bearer ' + session[:access_token].to_s

    # res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    #   http.request(req)
    # }

    puts "About to make call to Google Calendar API...Hooray!!!"

    response = RestClient::Request.execute(
      :method => :get,
      :url => encoded_url,
      :headers => {'Authorization' => 'Bearer ' + session[:access_token].to_s, :content_type => 'application/json'})

    @response = JSON.parse(response)
    puts "Calendar API response"
    puts @response['summary']

    # Fetch the next 10 events for the user

    # calendar_id = 'primary'
    # @response = service.list_events(calendar_id,
    #                                max_results: 10,
    #                                single_events: true,
    #                                order_by: 'startTime',
    #                                time_min: Time.now.iso8601)

      ###  Writes results to console ###
      puts @response['summary']
      puts "Upcoming events:"
      puts "No upcoming events found"

    if @response['items'].empty?
      ### This is the data that the controller would need to return and pass into views
      @result = @response['items']
        @response.items.each do |event|
          @start = event.start.date
          @time = event.start.date_time
          @appointment = event.summary
          puts "- #{event.summary} (#{@start})"
          puts "-#{event.start.date}"
        end
    end
  end

#            <% @result.each do |event| %>
#             <% @dt = event.start.date_time  %>
#               <td><%= @dt.strftime('%B %d, %Y')%></td>
#               <td><%= @dt.strftime('%I:%M %p') %></td> 
#               <td><%= event.summary %></td>
#               <td><%= event.location %></td>
#             <%end%>
  




  def new
     @job = Job.new
  end


  private
  def job_params
    params.require(:job).permit(:job_position,:company_name, :user_id)
  end







end
