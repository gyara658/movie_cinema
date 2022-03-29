10.times do |n|
  User.create!(
    username: "test#{n + 1 }",
    password: 123456,
    role: ((n == 0) ? "admin" : "user")
  )
end
