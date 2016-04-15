class AddStudyIdToParticipantstudy < ActiveRecord::Migration
  def change
    add_column :participantstudies, :study_id, :integer
  end
end
