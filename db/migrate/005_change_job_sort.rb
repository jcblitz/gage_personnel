class ChangeJobSort < ActiveRecord::Migration
  def self.up
    rename_column("jobs", "sort_order", "position")
  end

  def self.down
    rename_column("jobs", "position", "sort_order")
  end
end
