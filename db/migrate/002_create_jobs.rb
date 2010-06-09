class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.column "title", :string, :null => false
      t.column "description", :text, :null => false
      t.column "start_date", :datetime
      t.column "end_date", :datetime
      t.column "is_active", :boolean, :null => false, :default => 1
      t.column "is_hot_job", :boolean, :default => 0
      t.column "sort_order", :integer
      t.column "category_id", :integer
    end
  end

  def self.down
    drop_table :jobs
  end
end
