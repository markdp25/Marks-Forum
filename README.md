# README

1. User Model
   -Devise
     -email:string
     -password:string

  -has_many :forum_threads
  -has_many :forum_posts

2. ForumThread
  -title:string
  -user_id:integer

  -belongs_to :user
  -has_many :forum_posts

3. ForumPost
  -forum_thread_id:integer
  -user_id:integer
  -body:text

  -belongs_to :forum_thread
  -belongs_to :user
