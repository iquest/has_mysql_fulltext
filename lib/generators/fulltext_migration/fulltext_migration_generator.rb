require 'rails/generators/active_record'
require 'active_support/core_ext/object/inclusion'

module ActiveRecord
  module Generators
    class FulltextMigrationGenerator < Rails::Generator::Base

      def create_migration_file
        migration_template "migration.rb", "db/migrate/create_fulltext_indicies.rb"
      end
    end
  end
end