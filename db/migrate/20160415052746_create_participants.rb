class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :partname
      t.string :gender
      t.date :dob
      t.string :address

      t.timestamps null: false
    drop table :participants  
    end
  end
end
