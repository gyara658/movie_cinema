profile_text = ["アクション","映画","洋画",",アメコミ","マーベル","ディズニー","恋愛系","どんなジャンルでも","サスペンス","ハリウッド"]
10.times do |n|
  User.create!(
    username: "test#{n + 1 }",
    password: 123456,
    profile: "#{profile_text[n]}の映画が好きです。",
    role: ((n == 0) ? "admin" : "user")
  )
end
