class AddDeletedToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :deleted, :boolean, default: false
  end
end
