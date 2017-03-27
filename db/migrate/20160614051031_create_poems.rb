class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title
      t.text :content
      t.string :auther

      t.timestamps null: false
    end
  end
end
