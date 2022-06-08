require 'rails_helper'


RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.create(:user, :a)
  end
  describe "#show" do
    context "as an authorized user" do
      before do
        sign_in @user
      end
      # 正常なレスポンスか？
      it "ユーザーページ" do
        get "/users/#{@user.id}"
        expect(response).to have_http_status("200")
      end
    end
  end

  describe "#new" do
    it "sign_in画面" do
      sign_in @user
      get "/users/sign_in"
      expect(response).to have_http_status("302")
    end
    it 'sign_up画面' do
      get "/users/sign_up"
      expect(response).to have_http_status("200")
#      puts response.body
    end
  end

  describe "#edit" do
    before do
      sign_in @user
    end
  # 200レスポンスが返ってきているか？
    it "編集画面" do
      get "/users/edit"
      expect(response).to have_http_status("200")
    end
  end

  describe '非ログイン' do
   context "本人ではない場合" do
     it 'ルートパスにリダイレクト' do
       get root_path
       expect(response).to have_http_status("200")
     end
   end
 end
end
