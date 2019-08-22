class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.text :description
      t.boolean :done

      t.timestamps
    end
  end
end
