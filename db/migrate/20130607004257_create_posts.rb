class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :posted_at
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
