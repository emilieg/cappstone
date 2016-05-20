
class DashboardController < ApplicationController
  before_action :is_authenticated?

  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'
  require 'fileutils'
  require 'rest-client'
  require 'net/http'
  require 'uri'


  def show
    @jobs = Job.all
    # @job = Job.where(user_id: session[:user_id])
    @job = Job.where(user_id: 1)
    @company = Company.all

    email = session[:email]
    timeMin = Time.now.iso8601
    maxResults = 10

    puts 'EMAIL FROM SESSION'
    puts email

    puts 'TIME MIN'
    puts timeMin

    encoded_url = URI.encode('https://www.googleapis.com/calendar/v3/calendars/' + email + '/events?timeMin='+timeMin)
    puts 'encoded_url'
    puts encoded_url

    puts 'access_token'
    puts session[:access]

    puts "About to make call to Google Calendar API...Hooray!!!"

    response = RestClient::Request.execute(
      :method => :get,
      :url => encoded_url,
      :headers => {'Authorization' => 'Bearer ' + session[:access_token].to_s, :content_type => 'application/json'})

    @response = JSON.parse(response)
    puts "Calendar API response"
    puts @response

    # if @response['items'].empty?
      ### This is the data that the controller would need to return and pass into views
      @result = @response['items']
    
        @response['items'].each do |event|
          @event_name =  event['summary']
          @location = event['location']
          @appointment = event['start']['dateTime']
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
