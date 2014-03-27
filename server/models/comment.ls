require! {
  Sequelize: sequelize
  '../config/sequelize'
  Mapping: './mapping'
}

const Comment = module.exports = sequelize.define 'Comment' do
  MappingId: do
    type: Sequelize.INTEGER
    unique: 'Mapping_and_Author'
    references: Mapping
    referencesKey: 'id'
  action: Sequelize.ENUM(...<[ up down ]>)
  content: Sequelize.TEXT
, classMethods: do
  findWithAuthor: (id) ->
    @find do
      where: {id}
