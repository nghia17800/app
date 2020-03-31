class AddStatusToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :status, :boolean, default: false
  end
end
