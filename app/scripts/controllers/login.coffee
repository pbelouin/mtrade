'use strict'

angular.module('App')
  .controller 'AppCtrl', ($scope, $ionicModal, $timeout, $firebase, $firebaseSimpleLogin, $rootScope) ->
    $scope.loginData = {}
    
    $ionicModal.fromTemplateUrl('templates/login.html', scope: $scope).then (modal) ->
      $scope.modal = modal
      ref = new Firebase("https://belouin.firebaseio.com")
      authClient = $firebaseSimpleLogin(ref)  
      # log user in using the Facebook provider for Simple Login
      $scope.loginWithFacebook = ->
        authClient.$login("facebook").then ((user) ->
          console.log "Logged in as: " + user.uid
        ), (error) ->
          console.error "Login failed: " + error
    
    $scope.closeLogin = ->
      $scope.modal.hide()
    $scope.login = ->
      $scope.modal.show()
    $scope.doLogin = ->
      console.log 'Doing login', $scope.loginData
      $timeout (->
        $scope.closeLogin()
      ), 1000