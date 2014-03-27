angular.module 'ioh-cover-maker.services' <[
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
      response.data = data.results or data.result or data
      response

.factory 'Poster' <[
       $resource  $window
]> ++ ($resource, $window) ->

  const Poster = $resource '/api/posters/:posterId' {posterId: '@id'}

  Poster::fullUrl = ->
    "#{ $window.location.origin }/posters/#{ @id }"

  Poster

.factory 'Index' <[
       $http
]> ++ ($http) ->

  upload: ->
    $http.post '/api/upload', it .then ({data}) -> data
