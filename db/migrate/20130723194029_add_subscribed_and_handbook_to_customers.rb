class AddSubscribedAndHandbookToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :subscribed, :boolean
    add_column :customers, :handbook, :boolean
  end
end
