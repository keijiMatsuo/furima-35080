require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it 'nickname, email, password, password_confirmation,
         last_name, first_name, last_name_kana, first_name_kana, birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上あれば登録できる' do
        @user.password = 'abCD12'
        @user.password_confirmation = 'abCD12'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it '重複したemailが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include ('Email has already been taken')
      end
      it 'emailに@が無ければ登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0abc1'
        @user.password_confirmation = '0abc1'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数混合でないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'abCD12'
        @user.password_confirmation = 'efGH34'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'last_nameが全角(かな/カナ/漢字)でないと登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name is invalid")
      end
      it 'first_nameが全角(かな/カナ/漢字)でないと登録できない' do
        @user.first_name = 'bbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'last_name_kanaが全角(カナ)でないと登録できない' do
        @user.last_name_kana = 'ああｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid")
      end
      it 'first_name_kanaが全角(カナ)でないと登録できない' do
        @user.first_name_kana = 'いいｲｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birth day can't be blank")
      end
    end
  end
end
