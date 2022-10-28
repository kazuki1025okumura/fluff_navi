require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { build(:user) }
  let(:post) { build(:post, user: user) }

  describe 'バリデーション' do
    it '正常' do
      post.image = fixture_file_upload('spec/fixtures/images/sample.jpg')
      post.save
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end

    it '異常: 画像がない' do
      post_without_image = build(:post, image: nil)
      expect(post_without_image).to be_invalid
      expect(post_without_image.errors[:image]).to eq ["を入力してください"]
    end

    it '異常: タイトルが60文字より多い' do
      post_with_long_title = build(:post, title: 'a' * 61)
      expect(post_with_long_title).to be_invalid
      expect(post_with_long_title.errors[:title]).to eq ["は60文字以内で入力してください"]
    end
  end
end
