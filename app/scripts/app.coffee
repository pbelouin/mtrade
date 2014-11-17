'use strict'

angular.module('App', [
  'ionic'
  'config'
  'firebase'
  'ngCordova'
]).run(($ionicPlatform) ->

  $ionicPlatform.ready ->
    cordova.plugins.Keyboard.hideKeyboardAccessoryBar true  if window.cordova and window.cordova.plugins.Keyboard
    StatusBar.styleDefault()  if window.StatusBar

).config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state('root',
    url: ''
    abstract: true
    templateUrl: 'templates/menu.html'
    controller: 'AppCtrl'
  ).state('root.browse',
    url: '/browse'
    views:
      menuContent:
        templateUrl: 'templates/browse.html'
  ).state('root.ads',
    url: '/ads'
    views:
      menuContent:
        templateUrl: 'templates/ads.html'
        controller: 'AdsCtrl'
  ).state('root.single',
    url: '/ads/:adKey'
    views:
      menuContent:
        templateUrl: 'templates/ad.html'
        controller: 'AdCtrl'
  ).state 'root.new_ad',
    url: '/new_ad'
    views:
      menuContent:
        templateUrl: 'templates/new_ad.html'
        controller: 'NewAdCtrl'

  
  # if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise '/ads'