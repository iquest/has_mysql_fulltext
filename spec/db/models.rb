class FulltextIndex < HasMysqlFulltext::Index::Base
  
end

class SomethingWithFulltext < ActiveRecord::Base
	has_mysql_fulltext do
	  indexable_attribute :something
	  indexable_attribute :something_else
	end
end

class SomethingWithoutFulltext < ActiveRecord::Base

end