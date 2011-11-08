module HasMysqlFulltext
	module Indexable
		module InstanceMethods
			def create_fulltext_indices
			  if changed?
			    transaction do
			      (indexable_attributes & changed).each do |attr|
				      create_attribute_fulltext_index(attr)
				    end
				  end
				end
			end

      def create_attribute_fulltext_index(attr)
         ft_index = fulltext_indices.find_or_initialize_by_indexable_attribute(attr)
         ft_index.data = read_attribute(attr)
         ft_index.save
      end

			
			def indexable_attributes
			  self.class.indexable_attributes
			end
			
#			def update_fulltext_indices
#				fulltext_index.update_attribute(:data, fulltext_index_tokens)
#			end
#			
#			def create_or_update_fulltext_indices
#				fulltext_index.nil? ? create_fulltext_index : update_fulltext_index
#			end
		end
	end
end