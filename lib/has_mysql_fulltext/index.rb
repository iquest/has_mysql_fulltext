module HasMysqlFulltext
  module Index
    class Base < ActiveRecord::Base
      self.table_name = 'fulltext_indices'          

      belongs_to :indexable, :polymorphic => true
      
      #validates :indexable_attribute, :presence => true
      #validates :indexable_type, :presence => true
      #validates :indexable_id, :presence => true
      validates :indexable_attribute, :uniqueness => { :scope => [:indexable_id, :indexable_type]}
      
      scope :match, lambda { |expr| where("MATCH(fulltext_indices.data) AGAINST (? IN BOOLEAN MODE)",  prepare_expression(expr.strip)) }
      scope :attribute_match, lambda { |attr, expr| where("indexable_attribute = ?", attr).where("MATCH(fulltext_indices.data) AGAINST (? IN BOOLEAN MODE)",  prepare_expression(expr.strip)) }
      
      def self.prepare_expression(expr = "")
        expr.to_s.gsub(/[^\w\s]/, '').tr_s(" "," ").strip.split.uniq.map {|word| "+#{word}*"}.join(" ")
      end

    end
  end
end