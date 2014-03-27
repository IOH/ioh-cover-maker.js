angular.module 'ioh-cover-maker' <[
  ngAnimate
  ngResource
  ngSanitize
  ui.bootstrap
  ui.router
  angular.ujs
  ioh-cover-maker.templates
  ioh-cover-maker.services
  ioh-cover-maker.mappings
]>
.config <[
        $stateProvider  $locationProvider
]> ++ !($stateProvider, $locationProvider) ->
  $stateProvider
  .state 'Index' do
    url: '/'
    templateUrl: '/index.html'
    controller: 'IndexCtrl as index'

  $locationProvider.html5Mode true

.run <[
        $rootScope
]> ++ !($rootScope) ->

.controller 'IndexCtrl' class

  

  @$inject = <[
    $scope  Page ]>
  !($scope, Page) ->
    


