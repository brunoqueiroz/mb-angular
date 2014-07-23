'use strict'

angular.module('mbangularApp')
  .controller 'LoginCtrl', ($scope, Autenticacao, LoginService, $state) ->

    $scope.usuario = "Bruno"
    $scope.senha = "Bruno"

    loginSuccess = (dados) ->
      Autenticacao.atualizarDadosUsuario(dados)
      $state.go 'usuario.listar'

    $scope.efetuarLogin = () ->
      LoginService.login($scope.usuario, $scope.senha, loginSuccess)

    
    


    

