class CreateFulltextIndices < ActiveRecord::Migration
  def change
    create_table :fulltext_indices, :options => "ENGINE = MyISAM" do |t|
      t.references :indexable, :polymorphic => true
      t.string :attr
      t.text :data, :limit => 16777215 #limit to 16M, for longtext can be changed up to 4294967295

      t.timestamps
    end
    add_index :fulltext_indices, [ :indexable_id, :indexable_type]
    add_index :fulltext_indices, :attr
    add_index :fulltext_indices, :data, 'fulltext'
  end
end
  

