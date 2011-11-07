module HasMysqlFulltext
  module Indexable
    def self.included(base)
      autoload :ClassMethods,    'has_mysql_fulltext/indexable/class_methods'
      autoload :InstanceMethods, 'has_mysql_fulltext/indexable/instance_methods'
      base.extend  ClassMethods
    end
  end
end
