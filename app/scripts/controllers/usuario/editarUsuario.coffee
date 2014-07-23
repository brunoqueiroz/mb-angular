'use strict'

angular.module('mbangularApp')
  .controller 'EditarUsuarioCtrl', ($scope, usuario,$log,$state) ->

    $scope.usuario = usuario

    $scope.fechar = () ->
      $state.go "usuario.listar"

    $scope.salvar = (usuario) ->
      $log.info "Salvando usuário #{usuario.nome}"


