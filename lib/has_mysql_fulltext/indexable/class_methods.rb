module HasMysqlFulltext
	module Indexable
		module ClassMethods
		  def has_mysql_fulltext opts={}, &block
		    @fulltext_attributes = []
		    yield if block_given?
        class_eval do
          after_save :create_or_update_the_fulltext_indices
          has_many :fulltext_indices, :as => :indexable, :dependent => :destroy
        end
        send :include, HasMysqlFulltext::Indexable::InstanceMethods
      end
      
      def fulltext_attribute name
          name = name.to_s if !name.is_a? String
          self.class_eav_attributes[name] = type
      end
      
      def class_fulltext_attributes
        @eav_attributes
      end

      
			def fulltext_index_columns
			  
				self.columns.select {|c| c.type == :string}.map(&:name).map(&:to_sym)
			end
			def search(expr, options = {})
				self.find(:all, options)
			end
			def create_fulltext_indices
				transaction do
					self.all.each {|m| m.create_or_update_fulltext_index }
				end
			end
		end
	end
end