require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '正常' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it '異常: ニックネームがない' do
      user_without_name = build(:user, name: '')
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it '異常: メールアドレスがない' do
      user_without_email = build(:user, email: '')
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["を入力してください"]
    end

    it '異常: メールアドレスがすでに存在する' do
      first_user = build(:user)
      new_user = build(:user, email: first_user.email)
      expect(new_user).to be_valid
      expect(new_user.errors).to be_empty
    end

    it '異常: パスワードがない' do
      user_without_password = build(:user, password: '')
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq ["は3文字以上で入力してください"]
    end

    it '異常: パスワード確認がない' do
      user_without_password_confirmation = build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ["とパスワードの入力が一致しません", "を入力してください"]
    end

    it '異常: パスワードが３文字未満' do
      user_with_short_password = build(:user, password: 'a', password_confirmation: 'a')
      expect(user_with_short_password).to be_invalid
      expect(user_with_short_password.errors[:password]).to eq ["は3文字以上で入力してください"]
    end
  end
end
