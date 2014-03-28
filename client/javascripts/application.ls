angular.module 'ioh-cover-maker' <[
  ngAnimate
  ngResource
  ngSanitize
  ui.bootstrap
  ui.router
  angular.ujs
  ng-form-data
  ioh-cover-maker.templates
  ioh-cover-maker.services
]>
.config <[
        $stateProvider  $locationProvider
]> ++ !($stateProvider, $locationProvider) ->
  $stateProvider
  .state 'Index' do
    url: '/'
    templateUrl: '/index.html'
    controller: 'IndexCtrl as index'

  .state 'Poster' do
    url: '/posters'
    abstract: true
    template: '<ui-view/>'

  .state 'Poster.Show' do
    url: '/:id'
    templateUrl: '/index.html'
    controller: 'IndexCtrl as index'

  $locationProvider.html5Mode true

.run <[
        $rootScope
]> ++ !($rootScope) ->


.directive 'html2canvas' <[
       $window  $q
]> ++ ($window, $q) ->

  function render ($element)
    const deferred = $q.defer!
    const options = do
      chinese: true
      onrendered: deferred.resolve

    $window.html2canvas $element, options
    deferred.promise

  !($scope, $element, $attrs) ->
    $scope[$attrs.html2canvas] = do
      render: angular.bind void, render, $element.0

.controller 'IndexCtrl' class

  save: !->
    @$scope.poster.$save!

  @$inject = <[
     $scope   $window   $stateParams   Poster ]>
  !(@$scope, @$window, @$stateParams, @Poster) ->
    $scope.poster = if 'id' of $stateParams
       Poster.get posterId: $stateParams.id
    else new Poster do
      name: '莊智超 Chih-chao Chuang'
      location: 'MIT Media Lab'
      brief: '''希望提供一個跨國、跨領域的公開經驗交流分享平台，
      邀請在海外讀書工作的學子，當台灣同學的耳與目，以影片與文字的方式，
      分享在國外學習、工作的所見所聞以及就讀與申請的經驗給所有的台灣朋友，
      讓他們有勇氣與智慧去追逐自己的夢想，為了他們自己，也為了我們台灣的未來。
      '''.replace /\n/, ''
      exprs: [
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
        'MIT Media Lab, Master of Science Media Arts and Science 碩士, 20xx'
      ]
      useColor: 'black'
      useAvatar: true

      cover: '/index/cover.jpg'
      avatar: '/index/avatar.png'

    $scope.$on 'success' !(event, key, image) ->
      $scope.poster[key] = image

    $scope.saveFile = !->
      <-! $scope.preview.render!then
      it.toBlob ->
        $window.saveAs it, 'poster.png'
      , 'image/png', 100

.controller 'ImageUploadCtrl' class

  upload: (key) ->
    <~! @Index.upload @$scope.newImage .then
    @$scope.$emit 'success' key, it

  @$inject = <[
     $scope   Index ]>
  !(@$scope, @Index) ->
