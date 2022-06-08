require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'コメント作成' do
    it "コメント作成" do
      post = FactoryBot.build(:post)
      expect(post).to be_valid
    end

    it "コメント未入力" do
      post = FactoryBot.build(:post, body: "")
      expect(post).to_not be_valid
    end
  end
end
