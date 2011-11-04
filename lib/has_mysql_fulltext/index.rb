module HasMysqlFulltext
  class Index < ActiveRecord::Base
    
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
end