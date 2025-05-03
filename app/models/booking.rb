class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

  # チェックインが過去日付にならないようにする
  validate :check_in_cannot_be_in_the_past

  # チェックアウトがチェックインより日付が後になるように
  validate :check_out_after_check_in

  private

  def check_in_cannot_be_in_the_past
    return unless check_in
    if check_in < Date.current
      errors.add(:check_in, "は過去の日付を選択できません")
    end
  end

  def check_out_after_check_in
    return unless check_in && check_out
    if check_out <= check_in
      errors.add(:check_out, "はチェックインより後の日付を選択してください")
    end
  end
end
