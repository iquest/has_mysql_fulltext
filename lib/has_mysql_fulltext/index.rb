module HasMysqlFulltext
  module Index
    class Base < ActiveRecord::Base    
      autoload :ClassMethods,    'has_mysql_fulltext/index/class_methods'
      autoload :InstanceMethods, 'has_mysql_fulltext/index/instance_methods'
      include InstanceMethods
      extend  ClassMethods
      
      set_table_name 'fulltext_indices'

      belongs_to :indexable, :polymorphic => true
      
      #validates :indexable_attribute, :presence => true
      #validates :indexable_type, :presence => true
      #validates :indexable_id, :presence => true
      validates :indexable_attribute, :uniqueness => { :scope => [:indexable_id, :indexable_type]}
      
      scope :match, lambda { |expr| where("MATCH(fulltext_indices.data) AGAINST (? IN BOOLEAN MODE)",  prepare_expression(expr.strip)) }
      scope :attribute_match, lambda { |attr, expr| where("indexable_attribute = ?", attr).where("MATCH(fulltext_indices.data) AGAINST (? IN BOOLEAN MODE)",  prepare_expression(expr.strip)) }
    end
  end
end