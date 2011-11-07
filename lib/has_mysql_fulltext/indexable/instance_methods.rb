module HasMysqlFulltext
	module Indexable
		module InstanceMethods
			def fulltext_index_tokens
				self.class.fulltext_index_columns.map do |column|
					read_attribute(column)
				end.join(' ').strip
			end
			
			def create_fulltext_indices
				build_fulltext_index(:data => fulltext_index_tokens)
			end
			
			def update_fulltext_indices
				fulltext_index.update_attribute(:data, fulltext_index_tokens)
			end
			
			def create_or_update_fulltext_indices
				fulltext_index.nil? ? create_fulltext_index : update_fulltext_index
			end
		end
	end
end