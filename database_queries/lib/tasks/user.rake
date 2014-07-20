namespace :user do
  desc "creates 10 fake users"
  task fake_users: :environment do
    10.times do |n|
      User.create!(name: "User ##{n + 1}")
    end
  end
end