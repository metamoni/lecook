# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plans do |t|
      t.date :start_date
      t.date :end_date
      t.timestamps
    end

    create_table :menus do |t|
      t.belongs_to :recipe
      t.belongs_to :meal_plan
      t.timestamps
    end
  end
end
