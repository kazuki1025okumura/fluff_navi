require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'バリデーション' do
    it '正常' do
      report = build(:report)
      expect(report).to be_valid
      expect(report.errors).to be_empty
    end

    it '異常: 問い合わせ内容が選択されていない' do
      report_without_content = build(:report, content_id: nil)
      expect(report_without_content).to be_invalid
      expect(report_without_content.errors[:content]).to eq ["を入力してください"]
    end

    it '異常: 概要が10文字未満' do
      report_with_short_body = build(:report, body: 'a')
      expect(report_with_short_body).to be_invalid
      expect(report_with_short_body.errors[:body]).to eq ["は10文字以上で入力してください"]
    end
  end
end
