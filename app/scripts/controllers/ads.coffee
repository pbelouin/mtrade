'use strict'

angular.module('App')
  .controller 'AdsCtrl', ($scope, $firebase) ->
    ref        = new Firebase("https://belouin.firebaseio.com/ads")
    sync       = $firebase(ref)
    adsArray   = sync.$asArray()
    $scope.ads = adsArray 
