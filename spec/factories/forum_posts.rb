FactoryBot.define do
  factory :forum_post do
    forum_thread_id 1
    user_id 1
    body "MyText"
  end
end
