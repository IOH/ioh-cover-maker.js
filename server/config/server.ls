require! <[ express express-promise ]>

module.exports = express!
  ..set 'showStackError' true

  ..use express.compress!

  ..use express.json!
  ..use express.urlencoded!

  ..use express-promise!
