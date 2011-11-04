class Create<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table :<%= table_name %>, :options => "ENGINE = MyISAM" do |t|
      t.references :indexable, :polymorphic => true
      t.string :attr
      t.text :data, :limit => 16777215 #limit to 16M, for longtext can be changed up to 4294967295

      t.timestamps
    end
    add_index :<%= table_name %>, [ :indexable_id, :indexable_type]
    add_index :<%= table_name %>, :attr
    add_index :<%= table_name %>, :data, 'fulltext'
  end
end
  

