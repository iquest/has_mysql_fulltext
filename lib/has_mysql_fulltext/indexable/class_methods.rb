module HasMysqlFulltext
  module Indexable
    module ClassMethods

      def indexable_attribute name
        attr_name = name.to_s if !name.is_a? String
        self.indexable_attributes << attr_name
      end

      def indexable_class
        if superclass != ActiveRecord::Base
          @indexable_class ? @indexable_class : superclass.indexable_class
        else
          @indexable_class
        end
      end

      def indexable_attributes
        @indexable_attributes
      end

      def search(expr, options = {})
        conditions = options.delete :conditions
        indexable_ids = FulltextIndex.where(:indexable_type => indexable_class).match(expr).map(&:indexable_id)
	self.where(indexable_class.primary_key.to_sym => indexable_ids)
      end

      def create_fulltext_indices
        transaction do
          self.all.each {|record| record.create_fulltext_indices }
        end
      end
    end
  end
end