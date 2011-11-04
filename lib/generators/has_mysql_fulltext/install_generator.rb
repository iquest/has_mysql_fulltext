require 'rails/generators/active_record'

module HasMysqlFulltext 
  class InstallGenerator  < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_migration
        create_migration_file
        #migration_template "migration.rb", "db/migrate/create_fulltext_indicies.rb"
      end

      def generate_model
        create_model_file
        #invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
      end
      
    
  end
end