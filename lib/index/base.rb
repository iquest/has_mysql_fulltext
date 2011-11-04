module HasMysqlFulltext
	module Index
		def self.included(base)
			autoload :ClassMethods,    'index/class_methods'
			autoload :InstanceMethods, 'index/instance_methods'
			base.class_eval do
				include InstanceMethods
				extend  ClassMethods
				belongs_to :indexable, :polymorphic => true
			end
		end
	end
	
	class FulltextIndex < ActiveRecord::Base
	  include HasMysqlFulltext::Index
	end
end