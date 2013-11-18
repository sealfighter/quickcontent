class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :page, index: true
      t.string :title
      t.text :summary
      t.text :body

      t.timestamps
    end
  end
end
