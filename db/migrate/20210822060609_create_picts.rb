class CreatePicts < ActiveRecord::Migration[6.0]
  def change
    create_table :picts do |t|
      t.string      :title,     null: false, defalut:""
      t.text        :comment
      t.references  :user,      null: false, foreign_key: true 


      t.timestamps
    end
  end
end
