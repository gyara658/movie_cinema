require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー作成' do
    it "ユーザー作成" do
      user = FactoryBot.build(:user, :a)
      expect(user).to be_valid
    end

    it "名前がなければ登録できない" do
      expect(FactoryBot.build(:user, username: "")).to_not be_valid
    end

    it "メールアドレスがなければ登録できない" do
      expect(FactoryBot.build(:user, email: "")).to_not be_valid
    end

    it "email重複エラー" do
      User.create(
        username: "username1",
        email: "user1@user.com",
        password: "user1pass",
      )
      user = User.new(
        username: "username2",
        email: "user1@user.com",
        password: "user2pass",
      )
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードがなければ登録できない" do
      expect(FactoryBot.build(:user, password: "")).to_not be_valid
    end

    it "password_confirmationとpasswordが異なる場合保存できない" do
      expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid
    end
  end
end
