require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '@user内容に問題ない' do
        expect(@user).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '111111a'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = 111_111
        @user.password_confirmation = 111_111
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'Ａ１１１１１'
        @user.password_confirmation = 'Ａ１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordに英数字がないと登録できない' do
        @user.password = 'yyyyyy'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角文字では登録できない' do
        @user.first_name = 'aiu'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'first_nameが存在してもlast_nameが空では登録できない' do
        @user.first_name = '佐藤'
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが半角文字では登録できない' do
        @user.last_name = 'aiu'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'last_nameが存在してもfirst_nameが空では登録できない' do
        @user.first_name = ''
        @user.last_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが半角文字では登録できない' do
        @user.first_name_kana = 'gugu'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it 'first_name_kanaがカタカナ以外の全角文字では登録できない' do
        @user.first_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'first_name_kanaが存在してもlast_name_kanaが空では登録できない' do
        @user.first_name_kana = 'サトウ'
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaが半角文字では登録できない' do
        @user.last_name_kana = 'kakiku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
      it 'last_name_kanaがカタカナ以外の全角文字では登録できない' do
        @user.last_name_kana = 'かきくけこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end

      it 'last_name_kanaが存在してもfirst_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.last_name_kana = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
    end
  end
end
