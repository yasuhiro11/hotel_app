# spec/requests/bookings_spec.rb
require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  let(:user)     { User.create!(email: 'a@b.com', password: 'password') }
  let(:property) { Property.create!(title: 'テスト', city: '東京', country: '日本', price_per_night: 10000, user: user) }

  before do
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end

  describe "POST /bookings" do
    context "有効なパラメータ" do
      let(:valid_params) do
        {
          booking: {
            property_id: property.id,
            check_in:    Date.current + 1,
            check_out:   Date.current + 2,
            guests:      1
          }
        }
      end

      it "予約が作成され、予約一覧へリダイレクトされる" do
        expect {
          post bookings_path, params: valid_params
        }.to change(Booking, :count).by(1)
        expect(response).to redirect_to(reservations_path)
        # follow_redirect!
        # expect(response.body).to include("予約が完了しました！")
      end
    end

    context "無効なパラメータ (check_out ≤ check_in)" do
      let(:invalid_params) do
        {
          booking: {
            property_id: property.id,
            check_in:    Date.current + 2,
            check_out:   Date.current + 1,
            guests:      1
          }
        }
      end

      it "保存に失敗し new テンプレートを再描画する" do
        expect {
          post bookings_path, params: invalid_params
        }.not_to change(Booking, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Check out はチェックインより後の日付を選択してください")
      end
    end
  end
end
