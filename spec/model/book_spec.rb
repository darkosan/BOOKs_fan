# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { book.valid? }

    let!(:book) { create(:book,title:'hoge',body:'body') }
    let!(:book) { build(:book, user_id: user.id) }

     context 'titleカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        book.title = ''
        is_expected.to eq false
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        book.body = ''
        is_expected.to eq false
      end
    end
    context 'ジャンルカラム' do
      it '選択されていること', spec_category: "バリデーションとメッセージ表示" do

      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている', spec_category: "基本的なアソシエーション概念と適切な変数設定" do
        expect(Book.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'genreモデルとの関係' do
      it 'N:1となっている', spec_category: "基本的なアソシエーション概念と適切な変数設定" do
        expect(Book.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end
