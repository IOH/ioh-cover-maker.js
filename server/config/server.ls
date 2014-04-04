require! <[ express express-promise ]>

module.exports = express!
  ..set 'showStackError' true

  ..use express.bodyParser!

  ..use express-promise!
