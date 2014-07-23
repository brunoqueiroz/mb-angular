'use strict';
angular.module('mbangularApp')
  .factory 'UsuarioService', ($state, $rootScope, $q, $location, ALLOWED, RESTRICTED, $config, $http, ListarUsuarioTransformResponse) ->
    
    #ajustarRespostasDoServidor = () ->
      #for usuario in usuarios
        #console.log 'tratando'

    # Public API here
    {
      listar: (callback) ->
        $http.get("#{$config.URL_CONTEXT}/usuarios", {transformResponse: ListarUsuarioTransformResponse })
          .then (result) ->
            callback(result.data) if callback 
            return result.data

      recuperarUsuario: (id, callback) ->
        $http.get("#{$config.URL_CONTEXT}/usuario/#{id}")
          .then (result) ->
            callback(result.data) if callback 
            return result.data

     
    }
  