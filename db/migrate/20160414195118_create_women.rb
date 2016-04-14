class CreateWomen < ActiveRecord::Migration
  def change
    create_table :women do |t|
      t.json :videos

      t.timestamps null: false
    end
  end
end
