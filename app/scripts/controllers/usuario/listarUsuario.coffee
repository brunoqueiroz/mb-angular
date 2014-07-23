'use strict'

angular.module('mbangularApp')
  .controller 'ListarUsuarioCtrl', ($scope, $rootScope, $translate, usuarios, $log, $state) ->

    $scope.usuarios = usuarios

    # refrence watch
    $scope.$watch 'usuarios', (newVal, oldVal) ->
      $log.info "$watch por Referencia"
    , false

    # equality watch
    $scope.$watch 'usuarios', (newVal, oldVal) ->
      $log.info "$watch por Igualdade"
    , true

    $scope.editar = (event, entity) ->
      $state.go('usuario.editar', {id: entity.id})

    $scope.gridOptions =
      data: 'usuarios'
      columnDefs: [
        field: 'id'
        displayName: $translate.instant('usuario.ID')
        width: '*'
      ,
        field: 'nome'
        displayName: $translate.instant('usuario.NOME')
        width: '*'
      ,
        field: 'selected'
        displayName: $translate.instant('usuario.SELECIONADO')
        width: '*'
        cellTemplate: """
          <div class="ngSelectionCell">
            <input ng-click="row.entity.selected = !row.entity.selected" ng-checked="row.entity.selected" tabindex="-1" class="ngSelectionCheckbox" type="checkbox"/>
            <button class="btn-link pull-right" ng-click="editar($event, row.entity)"> 
              <spam class="glyphicon glyphicon-pencil"></spam>
            </button>  
          </div>
        """
      ]
 



