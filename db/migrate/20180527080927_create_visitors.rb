class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.belongs_to :url
      t.string :ip
      t.string :user_agent
      t.string :referer
      t.timestamps
    end
  end
end
