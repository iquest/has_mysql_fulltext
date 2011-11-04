require 'rubygems'
require 'active_record'

module HasMysqlFulltext
	autoload :Index,     'has_mysql_fulltext/index'
	autoload :Indexable, 'has_mysql_fulltext/indexable'
	def has_mysql_fulltext
		include HasMysqlFulltext::Indexable
	end
end

ActiveRecord::Base.extend HasMysqlFulltext
