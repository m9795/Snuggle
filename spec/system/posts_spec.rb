# frozen_string_literal: true
require 'rails_helper'

describe '投稿のテスト', type: :system do
  
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

  describe '投稿のテスト' do
    before do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      visit new_post_path
    end
    
    describe '新規投稿処理のテスト' do
      context '新規投稿画面へ遷移' do
        it '遷移する' do
          click_on 'カフェを投稿'
          expect(page).to have_content 'カフェを投稿'
          expect(current_path).to eq('/posts/new')
        end
      end
      
      context '表示の確認' do
        before do
          visit new_post_path
        end
        it 'タイトル入力フォームが表示される' do
          expect(page).to have_field 'タイトル'
        end
        it '本文入力フォームが表示される' do
          expect(page).to have_field '本文'
        end
        it '投稿するボタンが表示される' do
          expect(page).to have_button '投稿する'
        end

        context '投稿処理' do
          before do
            visit new_post_path
          end
          it '投稿に成功' do
            fill_in "タイトル", with: "タイトル"
            fill_in "本文", with: "本文"
            click_button "投稿する"
            expect(page).to have_current_path posts_path
            expect(page).to have_content 'タイトル'
          end
          it '投稿に失敗' do
            fill_in 'タイトル', with: ""
            fill_in '本文', with: ""
            click_button "投稿する"
            expect(page).to have_content "入力内容をご確認ください。"
          end
        end
      end
    end
  end
end
