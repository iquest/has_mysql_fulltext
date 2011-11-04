class <%= class_name %> < HasMysqlFulltext::FulltextIndex
  set_table_name '<%= table_name %>'
end