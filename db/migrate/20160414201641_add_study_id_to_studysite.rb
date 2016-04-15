class AddStudyIdToStudysite < ActiveRecord::Migration
  def change
    add_column :studysites, :study_id, :integer
  end
end
