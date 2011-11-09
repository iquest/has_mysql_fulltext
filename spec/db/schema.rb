ActiveRecord::Schema.define(:version => 1) do
drop_table :fulltext_indices rescue nil
  create_table :fulltext_indices, :options => "ENGINE = MyISAM" do |t|
    t.references :indexable, :polymorphic => true
    t.string :indexable_attribute
    t.text :data, :limit => 16777215 #limit to 16M, for longtext can be changed up to 4294967295

    t.timestamps
  end
  add_index :fulltext_indices, [ :indexable_id, :indexable_type]
  add_index :fulltext_indices, :indexable_attribute
  add_index :fulltext_indices, :data, 'fulltext'
  create_table :something_with_fulltexts, :force => true do |t|
    t.column :something, :string
    t.column :something_else, :string
  end
  create_table :something_without_fulltexts, :force => true do |t|

  end
end