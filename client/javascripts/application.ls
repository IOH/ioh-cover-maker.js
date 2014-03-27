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
    $scope.page = {
      name: '莊智超 Chih-chao Chuang'
      exprs: [
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
      ]
    }


