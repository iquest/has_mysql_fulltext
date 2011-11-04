require 'rails/generators/active_record/model/model_generator'

module HasMysqlFulltext 
  class InstallGenerator  < ActiveRecord::Generators::ModelGenerator

    argument :name, :default => "fulltext_index"
     

      source_root File.expand_path("../templates", __FILE__)

      def copy_migration
        create_migration_file
      end

      def generate_model
        create_model_file
      end
      
    
  end
end