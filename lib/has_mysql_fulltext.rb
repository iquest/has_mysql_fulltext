require 'rubygems'
require 'active_record'

module HasMysqlFulltext     
	require 'has_mysql_fulltext/index' 
	require 'has_mysql_fulltext/indexable'
end

ActiveRecord::Base.send :extend, HasMysqlFulltext::Indexable
