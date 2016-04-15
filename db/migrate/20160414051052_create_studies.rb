class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :title
      t.string :principal_investigator
      t.boolean :status, default:true

      t.timestamps null: false
    end
    add_index :studies, [:title, :principal_investigator], :unique => true
  end
end
