class AddCertificationHoursToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :certificationhours, :string
  end
end
