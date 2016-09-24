class RemoveIsAdminFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :is_admin, :boolean
  end
end
