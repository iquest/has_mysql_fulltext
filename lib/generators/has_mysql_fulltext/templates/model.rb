class <%= class_name %> < HasMysqlFulltext::Index
  set_table_name '<%= table_name %>'
end