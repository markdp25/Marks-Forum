require 'faker'
require 'random_data'

User.create(email: 'test@user.com', password: 'password',
  confirmed_at: Time.now
)

10.times do
  ForumThread.create!(

     subject: Faker::ProgrammingLanguage.name,
   )
 end
 forum_threads = ForumThread.all

 5.times do
   ForumPost.create!(

    body:   Faker::MostInterestingManInTheWorld.quote
   )

 end
forum_posts = ForumPost.all

5.times do
   Comment.create!(

     author: Faker::ProgrammingLanguage.creator,
     body: Faker::MostInterestingManInTheWorld.quote
   )
 end

puts "Seed finished"
puts "#{ForumThread.count} topics created"
puts "#{ForumPost.count} posts created"
puts "#{Comment.count} comments created"
