require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ActiveRecord do
	it 'should respond to has_mysql_fulltext' do
		ActiveRecord::Base.respond_to?(:has_mysql_fulltext).should be_true
	end
end

[SomethingWithFulltext, SomethingWithoutFulltext, FulltextIndex].each do |klass|
	describe klass do
		it 'should respond to has_mysql_fulltext' do
			SomethingWithFulltext.respond_to?(:has_mysql_fulltext).should be_true
		end
		[[HasMysqlFulltext::Indexable, SomethingWithFulltext], [HasMysqlFulltext::Index, FulltextIndex]].each do |(matching_module, matching_klass)|
			(klass == matching_klass).tap do |should_include|
				it "should #{'not' unless should_include} extend #{matching_module}::ClassMethods" do
					klass.is_a?(matching_module::ClassMethods).should eql(should_include)
				end
				it "should #{'not' unless should_include} include #{matching_module}::InstanceMethods" do
					klass.include?(matching_module::InstanceMethods).should eql(should_include)
				end
			end
		end
	end
end