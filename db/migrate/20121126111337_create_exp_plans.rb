class CreateExpPlans < ActiveRecord::Migration
  def change
    create_table :exp_plans do |t|
      t.string :username
      t.date :planday
      t.integer :roomname

      t.timestamps
    end
  end
end
