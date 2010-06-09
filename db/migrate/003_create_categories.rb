class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.column "name", :string, :null => false
      t.column "description", :text, :null => false
      t.column "is_active", :boolean, :null => false
      t.column "sort_order", :integer
    end
  end

  def self.down
    drop_table :categories
  end
end
