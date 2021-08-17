class AddReferencesToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :course, null: false, foreign_key: true
  end
end
