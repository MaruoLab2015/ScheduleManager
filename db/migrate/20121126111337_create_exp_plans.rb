class CreateExpPlans < ActiveRecord::Migration
  def change
    create_table :exp_plans do |t|
      t.string :userName
      t.date :planDay
      t.integer :roomName

      t.timestamps
    end
  end
end
