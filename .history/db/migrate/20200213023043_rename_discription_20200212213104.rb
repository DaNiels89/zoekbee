# frozen_string_literal: true

class RenameDiscription < ActiveRecord::Migration[6.0]
  def change
    rename_column :companies, :discription, :description
  end
end
