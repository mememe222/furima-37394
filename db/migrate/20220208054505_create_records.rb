class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :user
      t.references :item

      t.timestamps
    end
  end
end
