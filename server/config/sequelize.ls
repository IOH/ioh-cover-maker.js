require! {
  Sequelize: sequelize
}

const secret = do
  name: 'ioh-cover-maker'
  username: void
  password: void

const config = do
  dialect: 'postgres'
  protocol: 'postgres'
  port: 5432

if process.env.DATABASE_URL
  const matchRes = that.match /postgres:\/\/([^:]+):([^@]+)@([^:]+):(\d+)\/(.+)/

  secret.name = matchRes.5
  secret.username = matchRes.1
  secret.password = matchRes.2

  config.port = matchRes.4
  config.host = matchRes.3

module.exports = new Sequelize secret.name, secret.username, secret.password, config
