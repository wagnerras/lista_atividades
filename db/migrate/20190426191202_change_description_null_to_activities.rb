class ChangeDescriptionNullToActivities < ActiveRecord::Migration[5.2]
  def change
    change_column_null :activities, :description, false
  end
end
