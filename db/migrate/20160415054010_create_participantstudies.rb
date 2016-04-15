class CreateParticipantstudies < ActiveRecord::Migration
  def change
    create_table :participantstudies do |t|

      t.timestamps null: false
    end
  end
end
