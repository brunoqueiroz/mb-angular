'use strict';
angular.module('mbangularApp')
  .factory 'LoginService', ($q, $config, $http) ->
    
    # Public API here
    {
      recuperarDadosUsuarios: () ->
        $q.all([
          $http.get("#{$config.URL_CONTEXT}/usuario/detalhes")
          $http.get("#{$config.URL_CONTEXT}/me")
        ]).then (values) ->        
          console.log values
          return values

      login: (usuario, senha, callback) ->
        $http.post("#{$config.URL_CONTEXT}/login")
          .then (result) ->
            callback(result.data) if callback

    }
  