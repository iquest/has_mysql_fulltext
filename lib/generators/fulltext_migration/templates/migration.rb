class CreateFulltextIndices < ActiveRecord::Migration
  def change
    create_table :fulltext_indices, :options => "ENGINE = MyISAM" do |t|
      t.references :indexable, :polymorphic => true
      t.text :tokens

      t.timestamps
    end
    add_index :search_indices, [ :indexable_id, :indexable_type]
    add_index :search_indices, :tokens, 'fulltext'
end
