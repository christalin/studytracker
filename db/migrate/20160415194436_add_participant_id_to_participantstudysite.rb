class AddParticipantIdToParticipantstudysite < ActiveRecord::Migration
  def change
    add_column :participantstudysites, :participant_id, :integer
  end
end
