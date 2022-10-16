# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false

      t.timestamps
    end

    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :posts, column: :post_id
  end
end
