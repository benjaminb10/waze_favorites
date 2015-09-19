class AddDescriptionToSearch < ActiveRecord::Migration
  def change
  	enable_extension 'hstore'
  	add_column :searches, :description, :hstore
  end
end
