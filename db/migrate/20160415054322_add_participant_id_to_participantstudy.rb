class AddParticipantIdToParticipantstudy < ActiveRecord::Migration
  def change
    add_column :participantstudies, :participant_id, :integer
  end
end
