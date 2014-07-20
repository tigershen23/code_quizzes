namespace :post do
  desc "updates comments in posts table"
  task update_comments: :environment do
    Post.find_each do |post|
      post.comment_count = rand(1..100)
      post.save!
    end
  end
end

namespace :post do
  desc "assigns random user_ids"
  task random_user_ids: :environment do
    Post.find_each do |post|
      post.update_columns(user_id: rand(1..10))
    end
  end
end

namespace :post do
  desc "changing date to 2008"
  task change_date: :environment do |t, args|
    d = DateTime.new(2008, 05, 02)
    Post.limit(100).each_with_index do |post, index|
      new_day = d + index.day
      post.update_columns(created_at: new_day)
    end
  end
end