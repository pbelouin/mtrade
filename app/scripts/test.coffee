angular.module("demo.camera.ctrl", []).controller "CameraCtrl", ($scope, $cordovaCamera, $ionicModal) ->
  $scope.takePicture = ->
    options =
      quality: 50
      destinationType: Camera.DestinationType.DATA_URL
      sourceType: Camera.PictureSourceType.CAMERA

    
    # udpate camera image directive
    $cordovaCamera.getPicture(options).then ((imageData) ->
      $scope.cameraimage = "data:image/jpeg;base64," + imageData
    ), (err) ->
      console.log "Failed because: " + message

