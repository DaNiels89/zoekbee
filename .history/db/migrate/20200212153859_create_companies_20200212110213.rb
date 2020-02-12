# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :founder
      t.integer :user_id
      t.string :discription
      t.string :tag
      t.decimal :price

      t.timestamps
    end
  end
end
