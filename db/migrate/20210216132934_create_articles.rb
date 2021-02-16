# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, default: '', null: false
      t.text :content, default: ''
      t.string :cover
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
