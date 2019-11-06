# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(user_name: 'Test', email: 'test@test.com', password: 'test', description:'test', first_name: 'test', last_name:'test',phone_num:'test')
Course.create(course_code:'ECE110', course_name:'test')
Course.create(course_code:'ECE111', course_name:'test2')
Enrolment.create(user_name:'Test',course_name:'ECE110', user_id:'1', course_id:'1') 
Enrolment.create(user_name:'Test',course_name:'ECE111', user_id:'1', course_id:'2') 
StudyGroup.create(event_name:'test', user_name:'Test', location:'test', time:'test', description:'test', course_code:'ECE110', course_id:'1')
StudyGroup.create(event_name:'test2', user_name:'Test', location:'test2', time:'test2', description:'test2', course_code:'ECE111', course_id:'2')
Attendee.create(event_name:'test', user_name:'Test', user_id:'1', study_group_id:'1')
Attendee.create(event_name:'test2', user_name:'Test', user_id:'1', study_group_id:'2')