require! <[ express express-promise jade ]>

module.exports = express!
  ..set 'showStackError' true

  ..engine 'jade' jade.__express
  ..set 'view engine' 'jade'
  ..set 'views' './server/views'

  ..use express.bodyParser!

  ..use express-promise!
