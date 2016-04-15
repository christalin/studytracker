class AddColumnToStudysite < ActiveRecord::Migration
  def change
  	add_column :studysite, :study_id, :integer
  	add_column :studysite, :site_id, :integer
  end
end
