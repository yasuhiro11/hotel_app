# app/controllers/home_controller.rb
class HomeController < ApplicationController
  # Devise などで全アクションに認証をかけている場合、
  # トップページだけは誰でも閲覧できるようにするなら以下を追加
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    # 最新の物件を6件だけ取得（例）
    @featured_properties = Property.order(created_at: :desc).limit(6)

    # 検索フォームで使う物件タイプの候補を取得（例）
    @property_types = Property.distinct.pluck(:property_type).compact.sort
  end
end
