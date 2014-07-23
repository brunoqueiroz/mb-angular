'use strict';
angular.module('mbangularApp')
  .factory 'Autenticacao', ($state, $rootScope, $location, ALLOWED, RESTRICTED) ->
    
    {
      
      checarAutenticacao: (path, preventDefault) ->
        switch path.data.access
          when RESTRICTED
            if not $rootScope.userData.autenticado
              preventDefault() if preventDefault
              $state.transitionTo 'login'
          when ALLOWED
            if $rootScope.userData.autenticado and $location.path() is '/login'
              preventDefault() if preventDefault
              $state.transitionTo 'usuario.listar'
            break
            
      removerDadosUsuario: () ->
        $rootScope.userData = {autenticado: false, login: null}

      atualizarDadosUsuario: (dados) ->
        $rootScope.userData = dados
        $rootScope.userData.autenticado = true
    }
  