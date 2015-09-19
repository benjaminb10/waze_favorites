class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :start
      t.string :end

      t.timestamps null: false
    end
  end
end
