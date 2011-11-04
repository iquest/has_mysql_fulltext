require 'rubygems'
require 'active_record'

module HasMysqlFulltext
	autoload :Index,     'has_mysql_fulltext/index'
	autoload :Indexable, 'has_mysql_fulltext/indexable'
end

ActiveRecord::Base.extend HasMysqlFulltext::Indexable
