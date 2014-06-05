class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.title :string
      t.timestamps
    end
  end
end
