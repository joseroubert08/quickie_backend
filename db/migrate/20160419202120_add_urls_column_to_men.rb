class AddUrlsColumnToMen < ActiveRecord::Migration
  def change
    add_column :men, :urls, :string, array: true
  end
end
