class AddStudyIdToParticipantstudysite < ActiveRecord::Migration
  def change
    add_column :participantstudysites, :study_id, :integer
  end
end
