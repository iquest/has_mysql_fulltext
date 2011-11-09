require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SomethingWithFulltext do

	it 'should create the fulltext index' do
		a = SomethingWithFulltext.create!(:something => 'a')
		a.fulltext_indices.where("indexable_attribute = 'something'").first.data.should == "a"
	end

	it 'should update the fulltext index' do
		b = SomethingWithFulltext.create!(:something => 'b')
		b.fulltext_indices.where("indexable_attribute = 'something'").first.data.should == "b"
		b.update_attributes(:something_else => 'b2')
		b.save!
		b.fulltext_indices.where("indexable_attribute = 'something_else'").first.data.should == "b2"
	end

  it 'should destroy the fulltext index' do
    c = SomethingWithFulltext.create!(:something => 'c')
    c.fulltext_indices.where("indexable_attribute = 'something'").first.data.should == "c"
    c_id = c.id
    c.destroy
    FulltextIndex.where("indexable_type = 'SomethingWithFulltext' AND indexable_id = #{c_id}").first.should be_nil
  end


end