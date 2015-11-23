class AddApprovedToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :approved, :boolean, default: false
  end
end
