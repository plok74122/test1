class AddColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :diaries, :status, :string
  end
end
