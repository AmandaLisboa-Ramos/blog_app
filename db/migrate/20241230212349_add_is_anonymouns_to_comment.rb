class AddIsAnonymounsToComment < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :is_anonymous, :boolean, null: false, default: true
  end
end
