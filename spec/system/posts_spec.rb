# frozen_string_literal: true
require 'rails_helper'

describe '投稿のテスト', type: :system do
  # let!(:user) { create(:user, name: 'ユーザーA', email: 'sample@com', password: 'password', status: false) }
  # let!(:post) { create(:post, title: 'タイトル', content: '本文') }

  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end

    context '表示の確認' do
      it 'トップ画面(root_path)に「ようこそ、Snuggleへ」が表示されているか' do
        expect(page).to have_content 'ようこそ、Snuggleへ'
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
      it 'トップ画面に「新規登録」「ログイン」「ゲストログイン」が表示されているか' do
        expect(page).to have_content '新規登録' && 'ログイン' && 'ゲストログイン'
      end
    end
  end

  # 作成中
  # describe 'ログインのテスト' do
  #   before do
  #     # @user = FactoryBot.create(:user)
  #     # @user2 = FactoryBot.build(:user)
  #     # @user2.email = "test2@test.com"
  #     # @user2.create
  #     @user = FactoryBot.create(:user, name: 'ユーザーA', email: 'test2@test.com', password: 'password')
  #     byebug
  #     visit new_user_session_path
  #   end
  #   it 'ログイン後の遷移先の確認' do
  #     fill_in 'メールアドレス', with: @user.email
  #     fill_in 'パスワード', with: @user.password
  #     click_button 'ログイン'
  #     expect(page).to have_current_path user_path(@user.id)
  #   end
  # end

  describe '投稿のテスト' do
    before do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      visit new_post_path
    end
    context '投稿処理のテスト' do
      it '投稿後の遷移先と投稿の表示確認' do
        user = @user
        publish = true
        fill_in 'タイトル', with: 'タイトル'
        fill_in '本文', with: '本文'
        click_button '投稿する'
        expect(page).to have_current_path posts_path
        expect(page).to have_content 'タイトル'
      end
    end
  end
end
