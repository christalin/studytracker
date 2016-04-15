class AddSiteIdToStudysite < ActiveRecord::Migration
  def change
    add_column :studysites, :site_id, :integer
  end
end
