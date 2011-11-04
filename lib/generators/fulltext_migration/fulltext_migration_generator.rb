require 'rails/generators/active_record'
require 'active_support/core_ext/object/inclusion'

module HasMysqlFulltext
    class InstallGenerator < Rails::Generator::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_migration_file
        migration_template "migration.rb", "db/migrate/create_fulltext_indicies.rb"
      end
      
      def create_model_file
        template "model.rb", "app/models/fulltext_index.rb"
      end
    end
end