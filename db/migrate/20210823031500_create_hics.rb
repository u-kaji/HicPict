class CreateHics < ActiveRecord::Migration[6.0]
  def change
    create_table :hics do |t|
      t.text        :hic,     null: false
      t.string      :kigo,    null: false,  defalut:""
      t.references  :user,    null: false,  foreign_key: true
      t.references  :pict,    null: false,  foreign_key: true

      t.timestamps
    end
  end
end
