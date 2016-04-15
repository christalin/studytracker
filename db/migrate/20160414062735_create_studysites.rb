class CreateStudysites < ActiveRecord::Migration
  def change
    create_table :studysites do |t|

      t.timestamps null: false
    end
  end
end
