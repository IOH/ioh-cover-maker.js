exports.up = !(migration, DataType, done) ->
  migration.addColumn do
    'Posters'
    'hightlightIndex'
    type: DataType.INTEGER
    defaultValue: 0
  .complete done
