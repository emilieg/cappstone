# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create('name'=> 'Emilie Gerber', 'email'=> 'emiliegerberharris@gmail.com')

User.create('name'=> 'Drew Rudebusch', 'email'=> 'drewrudebusch@gmail.com')

Company.create('name'=> 'Amazon', 'address'=> '1234 5th Ave, Seattle, WA 98105', 'website'=> 'www.amazon.com', 'linkedin'=> 'www.linkedin.com/company/amazon')

Job.create('position'=> 'Full-stack Developer', 'department'=> 'Amazon Prime', 'address'=> '1234 5th Ave, Seattle, WA 98105', 'apply_date'=> '2016-05-09', 'job_description_url'=> 'www.amazon.com/careers', 'relocation'=> false, 'comp_value'=> 95000, 'comp_type'=> 'annual', company_id: 1, user_id: 1)

Job.create('position'=> 'Front-end Developer', 'department'=> 'Checkout/cart', 'address'=> '1234 5th Ave, Seattle, WA 98105', 'apply_date'=> '2016-05-10', 'job_description_url'=> 'www.amazon.com/careers', 'relocation'=> false, 'comp_value'=> 100000, 'comp_type'=> 'annual', company_id: 1, user_id: 2)

Contact.create('name'=> 'Susie Johnson', 'title'=> 'Technology Recruiter', 'phone'=> '555-555-5555', 'email'=> 'fakesusiejohnson@amazon.com', 'linkedin'=> 'www.linkedin.com/in/fakesusiejohnson', company_id: 1)

EventType.create('activity'=> 'Phone Interview')
EventType.create('activity'=> 'Informational Interview')
EventType.create('activity'=> 'In-person Interview')

Event.create('title'=> 'Phone interview', 'description'=> 'Preliminary Interview with Susie Johnson', 'event_timestamp'=> '2016-05-19 09=>30=>00AM', event_type_id: 1, job_id: 1)

Note.create('title'=> 'Similar background', 'content'=> 'Susie also went to UW. She graduated from the CS program.', job_id: 1)

#job is deck