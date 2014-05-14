require! {
  Sequelize: sequelize
  '../config/sequelize'
}

module.exports = sequelize.define 'Poster' do
  name: Sequelize.STRING
  location: Sequelize.STRING
  brief: Sequelize.TEXT
  exprs: Sequelize.ARRAY(Sequelize.STRING)
  hightlightIndex: Sequelize.INTEGER

  useColor: Sequelize.STRING
  useAvatar: Sequelize.BOOLEAN

  cover: Sequelize.STRING
  avatar: Sequelize.STRING
