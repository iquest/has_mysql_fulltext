require 'rubygems'
require 'active_record'

module HasMysqlFulltext
	autoload :Index,     'index/base'
	autoload :Indexable, 'indexable/base'
	def has_mysql_fulltext
		include HasMysqlFulltext::Indexable
	end
end

ActiveRecord::Base.extend HasMysqlFulltext

if ActiveRecord::Base.connection.table_exists? "fulltext_indicies"
  class FulltextIndex < ActiveRecord::Base
	  include HasMysqlFulltext::Index
  end
end