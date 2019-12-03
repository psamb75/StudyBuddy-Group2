# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create(user_name: 'Test', email: 'test@test.com', password: 'test', description:'test', first_name: 'test', last_name:'test',phone_num:'test')
#Course.create(course_code:'ECE110', course_name:'test')
#Course.create(course_code:'ECE111', course_name:'test2')
#Enrolment.create(user_name:'Test',course_name:'ECE110', user_id:'1', course_id:'1') 
#Enrolment.create(user_name:'Test',course_name:'ECE111', user_id:'1', course_id:'2') 
#StudyGroup.create(event_name:'test', user_name:'Test', location:'test', time:'test', description:'test', course_code:'ECE110', course_id:'1')
#StudyGroup.create(event_name:'test2', user_name:'Test', location:'test2', time:'test2', description:'test2', course_code:'ECE111', course_id:'2')
#Attendee.create(event_name:'test', user_name:'Test', user_id:'1', study_group_id:'1')
#Attendee.create(event_name:'test2', user_name:'Test', user_id:'1', study_group_id:'2')

#seed users
user = User.new(
    email: "test1@test.com",
    description: "1st year ECE",
    name: "Marky",
    first_name: "Mark",
    last_name: "May",
    phone_num: "2898921111",
    password: "testing", 
    password_confirmation: "testing"
)
    #user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!
#
user = User.new(
    email: "test2@test.com",
    description: "4th year eng sci specializing in robotics",
    name: "Amezz",
    first_name: "Amy",
    last_name: "Johnson",
    phone_num: "2898921112",
    password: "testing", 
    password_confirmation: "testing"
)
    #user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!
#
user = User.new(
    email: "test3@test.com",
    description: "First year history student. Love learning about the Roman empire",
    name: "Jman",
    first_name: "Juan",
    last_name: "Atkins",
    phone_num: "2898921113",
    password: "testing", 
    password_confirmation: "testing"
)
    #user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!

#seed courses
Course.create!(course_code:'ECE444', course_name:'Software Engineering', user_id:1)
Course.create!(course_code:'ECE568', course_name:'Computer Security', user_id:2)
Course.create!(course_code:'APS343', course_name:'Engineering Leadership', user_id:3)
Course.create!(course_code:'ECE310', course_name:'Fields and Waves', user_id:3)
Course.create!(course_code:'ECE421', course_name:'Machine Learning', user_id:3)
Course.create!(course_code:'APS360', course_name:'Introduction to Artifical Intelliegence', user_id:3)
Course.create!(course_code:'AST101', course_name:'Introduction to Astronomy', user_id:3)

#seed enrollments
Enrolment.create!(user_name:'Marky',course_name:'ECE444', user_id:1, course_id:1) 
Enrolment.create!(user_name:'Marky',course_name:'ECE568', user_id:1, course_id:2)
Enrolment.create!(user_name:'Marky',course_name:'ECE310', user_id:1, course_id:4)
#
Enrolment.create!(user_name:'Amezz',course_name:'ECE444', user_id:2, course_id:1) 
Enrolment.create!(user_name:'Amezz',course_name:'APS343', user_id:2, course_id:3)
Enrolment.create!(user_name:'Amezz',course_name:'ECE421', user_id:2, course_id:5)

Enrolment.create!(user_name:'Jman',course_name:'ECE568', user_id:3, course_id:2) 
Enrolment.create!(user_name:'Jman',course_name:'APS343', user_id:3, course_id:3)
Enrolment.create!(user_name:'Jman',course_name:'AST101', user_id:3, course_id:7)

#seed study groups - must fix after inning updates
StudyGroup.create!(event_name:'Studying for ECE 444 Final', user_name:'Marky', location:'Robarts', date:DateTime.new(2019,12,5,19), description:"final is approaching. we are dumb, must study", course_code:'ECE444', course_id:1,user_id:1)
StudyGroup.create!(event_name:'Coffee and chat', user_name:'Amezz', location:'Starbucks on College', date:DateTime.new(2019,12,5,17), description:"Let us get to know eachother", course_code:'APS343', course_id:3, user_id:2)

#seed attending
Attendee.create!(event_name:'Studying for ECE 444 Final', user_name:'Marky', user_id:1, study_group_id:1)
Attendee.create!(event_name:'Studying for ECE 444 Final', user_name:'Amezz', user_id:2, study_group_id:1)
Attendee.create!(event_name:'Coffee and chat', user_name:'Amezz', user_id:2, study_group_id:2)
Attendee.create!(event_name:'Coffee and chat', user_name:'Jman', user_id:3, study_group_id:2)

#seed tutors
Tutor.create!(user_name:"Amezz", course_code:"ECE444", description:"I'm really good at software please hire me!", rate: 20, user_id:2, course_id:1, date:DateTime.new(2019,12,4,19), hours:2, completed:false)
Tutor.create!(user_name:"Marky", course_code:"ECE568", description:"I took this course last year, got a 99%", rate: 20, user_id:1, course_id:2, date:DateTime.new(2019,12,4,19), hours:2, completed:false)
Tutor.create!(user_name:"Jman", course_code:"APS343", description:"This course was easy. I got you fam", rate: 10, user_id:3, course_id:3, date:DateTime.new(2019,12,5,20), hours:3, completed:false)

#seed tutoring sessions


