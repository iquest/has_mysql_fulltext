module HasMysqlFulltext
  module Indexable
      autoload :ClassMethods,    'has_mysql_fulltext/indexable/class_methods'
      autoload :InstanceMethods, 'has_mysql_fulltext/indexable/instance_methods'

      def has_mysql_fulltext opts={}, &block
        extend ClassMethods
        include InstanceMethods

        @indexable_attributes = []
        @indexable_class = self.to_s.camelize.constantize
        yield if block_given?
        class_eval do
          after_save :create_fulltext_indices
          has_many :fulltext_indices, :as => :indexable, :dependent => :destroy#, :class_name => "FulltextIndex"
        end
      end
  end
end
