class AddLocationToSchools < ActiveRecord::Migration
  def change
  	add_column :schools, :location, :string
  	add_index :schools, :location
  end
end
