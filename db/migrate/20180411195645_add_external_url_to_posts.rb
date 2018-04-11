class AddExternalUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :external_url, :string
  end
end
