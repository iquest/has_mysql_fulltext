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

        send :include, InstanceMethods
      end
      
      def fulltext_attribute name
          name = name.to_s if !name.is_a? String
          self.class_fulltext_attributes << name
      end
      
      def class_fulltext_attributes
        @fulltext_attributes
      end

			def search(expr, options = {})
				self.joins(:fulltex_indices).where("MATCH(fulltext_indices.data) AGAINST (? IN BOOLEAN MODE)",  expr.strip)
			end
			def create_fulltext_indices
				transaction do
					self.all.each {|m| m.create_or_update_fulltext_index }
				end
			end
		end
	end
end