class AddUrlsColumnToWomen < ActiveRecord::Migration
  def change
    add_column :women, :urls, :string, array: true
  end
end
