require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー登録' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規登録が成功する' do
        visit new_user_path
        fill_in 'ニックネーム', with: 'test'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録が完了しました'
        expect(current_path).to eq login_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規登録が失敗する' do
        visit new_user_path
        fill_in 'ニックネーム', with: 'test'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(current_path).to eq users_path
      end
    end

    context '登録済みのメールアドレスを使用' do
      it 'ユーザーの新規登録が失敗する' do
        existing_user = create(:user)
        visit new_user_path
        fill_in 'ニックネーム', with: 'test'
        fill_in 'メールアドレス', with: existing_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(current_path).to eq users_path
      end
    end

    context 'パスワードとパスワード確認の値が異なる' do
      it 'ユーザーの新規登録が失敗する' do
        visit new_user_path
        fill_in 'ニックネーム', with: 'test'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'hoge'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'
        expect(current_path).to eq users_path
      end
    end
  end
end
