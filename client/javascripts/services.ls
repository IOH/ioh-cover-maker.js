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

.factory 'Gems' <[
       $http
]> ++ ($http) ->

  search: (keyword) ->
    $http.get "/api/gems/search/#{ keyword }" .then ({data}) -> data

  info: (name) ->
    $http.get "/api/gems/info/#{ name }" .then ({data}) -> data

.factory 'Npm' <[
       $http
]> ++ ($http) ->

  search: (keyword) ->
    $http.get "/api/npm/search/#{ keyword }" .then ({data}) -> data

  info: (name) ->
    $http.get "/api/npm/info/#{ name }" .then ({data}) -> data

.factory 'Mapping' <[
       $http  Comment
]> ++ ($http, Comment) ->

  list: (params) ->
    $http.get '/api/mappings' {params}
    .then ({data}) ->
      for mapping in data when mapping.comments.length > 0
        mapping.comments.=map -> new Comment it
      data

  create: (gems, npm) ->
    $http.post '/api/mappings' {gems, npm}

.factory 'Comment' <[
       $resource
]> ++ ($resource) ->

  const Comment = $resource '/api/comments/:commentId', {commentId: '@id'}
  const prototype = Comment::

  prototype.isNewRecord = -> !@id


  Comment
