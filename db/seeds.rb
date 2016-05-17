# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Rake::Task["db:reset"]

User.create('name': 'Emilie Gerber', 'email': 'emiliegerberharris@gmail.com')

User.create('name': 'Drew Rudebusch', 'email': 'drewrudebusch@gmail.com') 

Company.create('name': 'Amazon', 'address': '123 4th St, Seattle, WA 98101', 'website': 'www.amazon.com', 'linkedin': 'http://www.linkedin.com/company/amazon')

Contact.create('name': 'Susie Johnson', 'title': 'Recruiter', 'phone': '555-555-5555', 'email': 'sjohnson@amazon.com', 'linkedin': 'http://www.linkedin.com/in/fakesusiejohnson', company_id: 1)

Job.create('position': 'Full-stack Developer', 'department': 'Amazon Prime', 'apply_date': '2016-05-09', 'job_description_url': 'http://www.amazon.com/careers', 'relocation': false, 'comp_value': 100000, 'comp_type': 'annual', company_id: 1, user_id: 2)

Job.create('position': 'Front-end Developer', 'department': 'Shopping cart', 'apply_date': '2016-05-11', 'job_description_url': 'http://www.amazon.com/careers', 'relocation': false, 'comp_value': 95000, 'comp_type': 'annual', company_id: 1, user_id: 1)

Note.create('title': 'Common background', 'content': 'Susie and I both went to UW. She went to the CS program.', job_id: 1)

