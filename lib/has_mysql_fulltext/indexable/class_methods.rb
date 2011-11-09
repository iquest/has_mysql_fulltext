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
        FulltextIndex.where(:indexable_type => indexable_class).match(expr).map(&:indexable)
      #self.joins(:fulltext_indices).where("MATCH(fulltext_indices.data) AGAINST (? IN BOOLEAN MODE)",  expr.strip)
      end

      def create_fulltext_indices
        transaction do
          self.all.each {|record| record.create_fulltext_indices }
        end
      end
    end
  end
end