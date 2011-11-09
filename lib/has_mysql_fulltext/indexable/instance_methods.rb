module HasMysqlFulltext
  module Indexable
    module InstanceMethods
      def create_fulltext_indices
        transaction do
          indexable_attributes.each do |attr|
            create_attribute_fulltext_index(attr)
          end
        end
      end

      def create_attribute_fulltext_index(attr)
        ft_index = fulltext_indices.where({:indexable_attribute => attr}).first
        ft_index = fulltext_indices.build({:indexable_attribute => attr}) unless ft_index 
        ft_index.data = read_attribute(attr)
        ft_index.save!
      end

      def indexable_attributes
        self.class.indexable_attributes
      end
    end
  end
end