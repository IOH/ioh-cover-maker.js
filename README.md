# ioh-cover-maker
> IOH cover maker

[![Travis CI   ](https://travis-ci.org/tomchentw/ioh-cover-maker.svg?branch=master)                 ](https://travis-ci.org/tomchentw/ioh-cover-maker)
[![Quality     ](https://img.shields.io/codeclimate/github/tomchentw/ioh-cover-maker.svg)           ](https://codeclimate.com/github/tomchentw/ioh-cover-maker)
[![Coverage    ](https://img.shields.io/coveralls/tomchentw/ioh-cover-maker.svg)                    ](https://coveralls.io/r/tomchentw/ioh-cover-maker)
[![Dependencies](https://gemnasium.com/tomchentw/ioh-cover-maker.svg)                               ](https://gemnasium.com/tomchentw/ioh-cover-maker)


## Project philosophy

### Develop in LiveScript
[LiveScript](http://livescript.net/) is a compile-to-js language, which provides us more robust way to write JavaScript.  
It also has great readibility and lots of syntax sugar just like you're writting python/ruby.


## Usage

### Sync remote database to local

Use [`heroku pg:transfer`](http://www.higherorderheroku.com/articles/pgtransfer-is-the-new-taps/):

```sh
curl -o production.dump `heroku pgbackups:url`
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d 'ioh-cover-maker' production.dump
```


## Contributing

[![devDependency Status](https://david-dm.org/tomchentw/ioh-cover-maker/dev-status.svg?theme=shields.io)](https://david-dm.org/tomchentw/ioh-cover-maker#info=devDependencies)

1. Fork it ( https://github.com/tomchentw/ioh-cover-maker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request