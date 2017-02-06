class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
    	t.integer :user_id
    	t.string :title
    	t.text :context
      t.timestamps
    end
    add_index :diaries, :user_id
  end
end
