'use strict'

angular.module('App')
  .controller 'NewAdCtrl', ($scope, $cordovaCamera, $firebase, $state, $ionicViewService) ->
    $scope.ad =
      title: ""
      text: ""
    ref = new Firebase("https://belouin.firebaseio.com/ads")
    
    $ionicViewService.nextViewOptions
       disableAnimate: true
       disableBack: true    
    
    $scope.save = ->
      ref.push
        title: $scope.ad.title
        text: $scope.ad.text
        picture: $scope.cameraImage
      $state.go('root.ads')
    
    $scope.takePicture = ->
      options =
        quality: 50
        targetWidth: 350
        targetHeight: 350
        destinationType: Camera.DestinationType.DATA_URL
        sourceType: Camera.PictureSourceType.CAMERA

      # udpate camera image directive
      $cordovaCamera.getPicture(options).then ((imageData) ->
        $scope.cameraImage = "data:image/jpeg;base64," + imageData
      ), (err) ->
        console.log "Failed because: " + message