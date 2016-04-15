class AddStudysiteIdToParticipantstudysite < ActiveRecord::Migration
  def change
    add_column :participantstudysites, :studysite_id, :integer
  end
end
