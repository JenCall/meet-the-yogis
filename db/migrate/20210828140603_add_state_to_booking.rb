class AddStateToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :state, :string, default: "pending"
  end
end
