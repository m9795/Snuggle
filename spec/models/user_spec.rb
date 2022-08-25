# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '登録ができるとき' do
      it 'すべての項目が正しく入力されているとき' do
        expect(@user).to be_valid
      end
    end
    context '登録できないとき' do
      it 'nameが空のとき' do
        @user.name=""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
        expect(@user.errors.full_messages).to include("名前は1文字以上で入力してください")
      end
      it 'nameが21文字のとき' do
        @user.name="123456789012345678901"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は20文字以内で入力してください")
      end
      it 'emailが空のとき' do
        @user.email=""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'passwordが空のとき' do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字以下のとき' do
        @user.password="12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '確認用パスワードが空のとき' do
        @user.password_confirmation=""
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it '確認用パスワードが6文字以下のとき' do
        @user.password_confirmation="12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it '確認用パスワードがパスワードと異なるとき' do
        # @userのパスワードは123456で作成している
        @user.password_confirmation="123457"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end
  end
end
