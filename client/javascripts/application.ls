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
      location: 'MIT Media Lab'
      brief: '''希望提供一個跨國、跨領域的公開經驗交流分享平台，
      邀請在海外讀書工作的學子，當台灣同學的耳與目，以影片與文字的方式，
      分享在國外學習、工作的所見所聞以及就讀與申請的經驗給所有的台灣朋友，
      讓他們有勇氣與智慧去追逐自己的夢想，為了他們自己，也為了我們台灣的未來。
      '''.replace /\n/, ''
      avatar: '/index/avatar.png'
      name: '莊智超 Chih-chao Chuang'
      exprs: [
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
      ]
    }


