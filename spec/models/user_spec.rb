# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  favorite_cafe          :string
#  favorite_color         :string
#  favorite_drink         :string
#  favorite_food          :string
#  fighting               :string
#  introduction           :text
#  name                   :string           not null
#  relax                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sleeping_time          :string
#  status                 :boolean          default(FALSE), not null
#  study_content          :string
#  studying_time          :string
#  target                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザ新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context "登録ができるとき" do
      it "すべての項目が正しく入力されているとき" do
        expect(@user).to be_valid
      end
    end
    context "登録できないとき" do
      it "nameが空のとき" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
        expect(@user.errors.full_messages).to include("名前は1文字以上で入力してください")
      end
      it "nameが21文字のとき" do
        @user.name = "123456789012345678901"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は20文字以内で入力してください")
      end
      it "emailが空のとき" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "passwordが空のとき" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが6文字以下のとき" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "password_confirmationが空のとき" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it "password_confirmationが6文字以下のとき" do
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it "password_confirmationがパスワードと異なるとき" do
        # @userのpasswordは123456で作成している
        @user.password_confirmation = "123457"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end
  end
end
