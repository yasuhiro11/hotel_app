class BookingsController < ApplicationController
  # new/create アクションの前にログイン必須チェック
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
  end

  def show
  end

  def new
    @property = Property.find(params[:property_id])
    @booking = Booking.new
  end

  def create
    @property = Property.find(params[:booking][:property_id])
    @booking = current_user.bookings.build(booking_params)
    @booking.total_price = @property.price_per_night * (@booking.check_out - @booking.check_in).to_i
    @booking.status = "confirmed"

    if @booking.save
      redirect_to reservations_path, notice: "予約が完了しました！"
    else
      flash.now[:alert] = @booking.errors.full_messages.join(",")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to reservations_path, notice: "予約をキャンセルしました"
  end
end

private

def booking_params
  params.require(:booking).permit(:check_in, :check_out, :guests, :property_id)
end
