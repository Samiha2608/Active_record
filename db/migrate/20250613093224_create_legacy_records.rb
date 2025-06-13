class CreateLegacyRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :legacy_data, id: false do |t|
      t.primary_key :legacy_id
      t.string :name
      t.text :info

      t.timestamps
    end
  end
end
