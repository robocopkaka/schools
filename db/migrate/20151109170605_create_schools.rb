class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_image
      t.text :school_description
      t.text :school_address

      t.timestamps null: false
    end
    add_index :schools, :school_name
    
  end
end
