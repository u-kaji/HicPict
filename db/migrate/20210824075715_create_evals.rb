class CreateEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :evals do |t|
      t.string      :review,   null: false
      t.integer     :scene,    null: false
      t.integer     :rhythm,   null: false
      t.integer     :kigo,     null: false
      t.integer     :tech,     null: false
      t.integer     :original, null: false

      t.references  :user,     null: false, foreign_key: true
      t.references  :hic,      null: false, foreign_key: true
      t.references  :pict,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
