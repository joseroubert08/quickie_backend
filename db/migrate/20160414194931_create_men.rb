class CreateMen < ActiveRecord::Migration
  def change
    create_table :men do |t|
      t.json :videos

      t.timestamps null: false
    end
  end
end
