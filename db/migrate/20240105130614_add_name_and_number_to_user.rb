# frozen_string_literal: true

class AddNameAndNumberToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone_number, :string, null: false
  end
end
