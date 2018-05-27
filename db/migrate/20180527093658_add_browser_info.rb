class AddBrowserInfo < ActiveRecord::Migration[5.2]
  def change
    change_table :visitors do |t|
      t.string :browser_name
      t.string :browser_version
    end
  end
end
