class AddClassificationToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :classification, :string
  end
end
