if @booking.persisted?
  # json.form render(partial: "card_product", formats: :html, locals: {booking: Booking.new})
  json.inserted_item render(partial: "card_product", formats: :html, locals: {restaurant: @restaurant, booking: @booking})
else
  json.form render(partial: "card_product", formats: :html, locals: {restaurant: @restaurant, booking: @booking})
end
