class CreateStudytimes < ActiveRecord::Migration[6.0]
  def change
    create_table :studytimes do |t|
      t.references :admin_user, foreign_key: true, null: false
      t.string :title, default: "タイトルなし"
      t.date :day, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.timestamps
    end
  end
end
