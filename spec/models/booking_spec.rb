require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:user)     { User.create!(email: 'a@b.com', password: 'password') }
  let(:property) { Property.create!(title: 'テスト', city: '東京', country: '日本', price_per_night: 10000, user: user) }

  subject do
    described_class.new(
      user:        user,
      property:    property,
      check_in:    Date.current + 1,
      check_out:   Date.current + 2,
      guests:      2
    )
  end

  it '有効な予約が作れる' do
    expect(subject).to be_valid
  end

  it 'check_in が過去日だと無効' do
    subject.check_in = Date.current - 1
    expect(subject).not_to be_valid
    expect(subject.errors[:check_in]).to include('は過去の日付を選択できません')
  end

  it 'check_out が check_in と同日または前日だと無効' do
    subject.check_out = subject.check_in
    expect(subject).not_to be_valid
    expect(subject.errors[:check_out]).to include('はチェックインより後の日付を選択してください')
  end
end
