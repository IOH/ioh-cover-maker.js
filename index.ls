require! {
  './config'
  './server/index'
}
require('newrelic') if config.env.is 'production'

index!
