# frozen_string_literal: true

class ChangeDiscription < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :discription, :text
  end
end
