require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "[create test]" do
    before do
      @user = FactoryBot.create(:user, :a)
    end

    context "#create" do
      # ログインしているか
      it "コメントできるか" do
        sign_in @user
        expect {
          @user.posts.create(id: 1, body: "テストコメント", review: 1, image: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg", poster_path: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg")
        }.to change{ @user.posts.count }.by(1)
      end

      it "無効な場合" do
        sign_in @user
        expect {
        @user.posts.create(id: 1, body: "", review: 1, image: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg", poster_path: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg")
        }.to_not change{ @user.posts.count }
      end
    end
  end

  describe "[destroy test]" do
    before do
      @user = FactoryBot.create(:user, :a)
    end

    context "#destroy" do
      it "コメントが削除されているか" do
        sign_in @user
        @user.posts.create(id: 1, body: "テストコメント", review: 1, image: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg", poster_path: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg")
        expect{ @user.posts.destroy }.to_not change{ Post.count }
      end

      it "ユーザーが削除されたらコメントが削除されているか" do
        sign_in @user
        @user.posts.create(id: 1, body: "テストコメント", review: 1, image: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg", poster_path: "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg")
        expect{ @user.destroy }.to change{ Post.count }.by(-1)
      end
    end
  end
end
