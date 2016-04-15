class CreateParticipantstudysites < ActiveRecord::Migration
  def change
    create_table :participantstudysites do |t|

      t.timestamps null: false
    end
  end
end
