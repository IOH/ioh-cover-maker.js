angular.module 'application' <[
  ui.bootstrap
  ga
  ngResource
  ui.router
  angular.ujs
  ng-form-data
  angular-loading-bar
  application.templates
  application.services
]>
.config <[
        $stateProvider  $locationProvider
]> ++ !($stateProvider, $locationProvider) ->
  function extend (that)
    angular.extend {}, do
      templateUrl: '/show.html'
      controller: 'ShowCtrl as show'
    , that

  $stateProvider
  .state 'Index' do
    url: '/'
    templateUrl: '/index.html'
    controller: 'IndexCtrl as index'

  .state 'Poster' do
    url: '/posters'
    abstract: true
    template: '<ui-view/>'

  .state 'Poster.Show' extend do
    url: '/:id'

  .state 'Poster.ShowWithName' extend do
    url: '/:id/:name'

  $locationProvider.html5Mode true

.directive 'html2canvas' <[
       $window  $q
]> ++ ($window, $q) ->

  function render ($element)
    const deferred = $q.defer!
    const options = do
      chinese: true
      useCORS: true
      onrendered: deferred.resolve

    $window.html2canvas $element, options
    deferred.promise

  !($scope, $element, $attrs) ->
    $scope[$attrs.html2canvas] = do
      render: angular.bind void, render, $element.0

.controller 'IndexCtrl' class

  save: !->
    <~! @$scope.poster.$save!then
    @$state.transitionTo 'Poster.Show', @$scope.poster{id}

  @$inject = <[
     $scope   $state   Poster ]>
  !(@$scope, @$state, @Poster) ->

    $scope.poster = new Poster do
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
      hightlightIndex: 0

      useColor: 'black'
      useAvatar: true

      cover: '/index/cover.jpg'
      avatar: '/index/avatar.png'

    $scope.posters = Poster.query!

.controller 'ShowCtrl' class

  save: !->
    @$scope.poster.$save!

  @$inject = <[
     $scope   $window   $stateParams   Poster ]>
  !(@$scope, @$window, @$stateParams, @Poster) ->
    $scope.poster = Poster.get posterId: $stateParams.id

    $scope.$on 'success' !(event, key, image) ->
      $scope.poster[key] = image

    $scope.saveFile = !->
      <-! $scope.preview.render!then
      it.toBlob ->
        $window.saveAs it, 'poster.png'
      , 'image/png', 100

.controller 'ImageUploadCtrl' class

  upload: (key) ->
    const {$scope} = @
    const {newImage, poster} = $scope
    newImage.title = poster.name
    newImage.description = poster.fullUrl!

    <-! @Index.upload newImage .then
    $scope.$emit 'success' key, it.link

  @$inject = <[
     $scope   Index ]>
  !(@$scope, @Index) ->
