# ng-form-data [![Travis CI][travis-image]][travis-url] [![Quality][codeclimate-image]][codeclimate-url] [![Coverage][coveralls-image]][coveralls-url] [![Dependencies][gemnasium-image]][gemnasium-url]
> Distributed via

[![Version][gem-image]][gem-url] [![Bower version][bower-image]][bower-url]

> Support input[type="file"] with ng-model and transparently submit with HTML5 FormData


## Project philosophy

### Develop in LiveScript
[LiveScript](http://livescript.net/) is a compile-to-js language, which provides us more robust way to write JavaScript.  
It also has great readibility and lots of syntax sugar just like you're writting python/ruby.


## Installation

### Just use it

* Download and include [`ng-form-data.js`](https://github.com/tomchentw/ng-form-data/blob/master/ng-form-data.js) OR [`ng-form-data.min.js`](https://github.com/tomchentw/ng-form-data/blob/master/ng-form-data.min.js).  

Then include them through script tag in your HTML.

### **Rails** projects (Only support 3.1+)

Add this line to your application's Gemfile:

```ruby
gem 'ng-form-data'
```

And then execute:

    $ bundle

Then add these lines to the top of your `app/assets/javascripts/application.js` file:

```javascript
//= require angular
//= require ng-form-data
```

And include in your `angular` module definition:

```javascript
var module = angular.module('my-awesome-project', ['tomchentw.boilerplate']).
```


## Usage


## Contributing

[![devDependency Status](https://david-dm.org/tomchentw/ng-form-data/dev-status.svg?theme=shields.io)](https://david-dm.org/tomchentw/ng-form-data#info=devDependencies)

1. Fork it ( https://github.com/tomchentw/ng-form-data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[gem-image]: https://img.shields.io/gem/v/ng-form-data.svg
[gem-url]: https://rubygems.org/gems/ng-form-data
[bower-image]: https://badge.fury.io/bo/ng-form-data.svg
[bower-url]: https://badge.fury.io/bo/ng-form-data

[travis-image]: https://travis-ci.org/tomchentw/ng-form-data.svg?branch=master
[travis-url]: https://travis-ci.org/tomchentw/ng-form-data
[codeclimate-image]: https://img.shields.io/codeclimate/github/tomchentw/ng-form-data.svg
[codeclimate-url]: https://codeclimate.com/github/tomchentw/ng-form-data
[coveralls-image]: https://img.shields.io/coveralls/tomchentw/ng-form-data.svg
[coveralls-url]: https://coveralls.io/r/tomchentw/ng-form-data
[gemnasium-image]: https://gemnasium.com/tomchentw/ng-form-data.svg
[gemnasium-url]: https://gemnasium.com/tomchentw/ng-form-data
[david-dm-image]: https://david-dm.org/tomchentw/ng-form-data/dev-status.svg?theme=shields.io
[david-dm-url]: https://david-dm.org/tomchentw/ng-form-data#info=devDependencies
