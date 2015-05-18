class CreateSchema < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
    end

    create_table :reviews do |t|
      t.integer :show_id
      t.string :critic_name
      t.string :publication_name
      t.float :score
      t.text :body
    end

    add_index :reviews, :show_id
  end
end
