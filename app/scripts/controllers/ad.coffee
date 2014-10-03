'use strict'

angular.module('App')
  .controller 'AdCtrl', ($scope, $stateParams, $firebase) ->
    ref = new Firebase("https://belouin.firebaseio.com/ads/#{$stateParams.adKey}")
    sync = $firebase(ref)
    $scope.ad = sync.$asObject()