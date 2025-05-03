class ReservationsController < ApplicationController
  def index
    @reservations = current_user.bookings
  end
end
