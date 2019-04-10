# frozen_string_literal: true

class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def change
    change_table :admins, bulk: true do |t|
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
      t.index :confirmation_token, unique: true
      # User.reset_column_information # Need for some types of updates, but not for update_all.
      # To avoid a short time window between running the migration and updating all existing
      # users as confirmed, do the following
      # Admin.update_all confirmed_at: DateTime.now.in_time_zone
      # All existing user accounts should be able to log in after this.
    end
  end
end
