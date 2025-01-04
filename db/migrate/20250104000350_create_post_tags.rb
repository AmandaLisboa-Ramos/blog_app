class CreatePostTags < ActiveRecord::Migration[8.0]
  def change
    create_table :post_tags do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
