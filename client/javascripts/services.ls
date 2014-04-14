angular.module 'application.services' <[
  ngResource
]>
.config <[
        $httpProvider
]> ++ !($httpProvider) ->

  $httpProvider.interceptors.push 'ioh-cover-makerInterceptor'

.factory 'ioh-cover-makerInterceptor' <[
       $q
]> ++ ($q) ->

  response: (response) ->
    const {data} = response
    if data.errors or data.error
      $q.reject that
    else
      response.data = data.results or data.result or data.data or data
      response

.factory 'Poster' <[
       $resource  $window
]> ++ ($resource, $window) ->

  const Poster = $resource '/api/posters/:posterId' {posterId: '@id'}

  Poster::fullUrl = ->
    "#{ $window.location.origin }/posters/#{ @id }/#{ @name }"

  Poster

.factory 'Index' <[
       $http
]> ++ ($http) ->

  const TOKEN = 'bd7900bdc834f416e50acd2a29f32086e7bba6cc9eb4b41f951cf929904afd50'

  upload: (newImg) ->
    newImg.album = TOKEN
    newImg.description or= 'http://ioh-cover-maker.herokuapp.com'

    $http do
      method: 'POST'
      url: 'http://putimgur.tomchentw.com/3/image'
      headers: do
        'Authorization': 'Client-ID 259364784188158'
        'Replacement': "Token #{ TOKEN }"
      data: newImg
    .then ({data}) -> data
