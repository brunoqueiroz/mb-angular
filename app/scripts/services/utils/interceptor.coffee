'use strict'

angular.module('mbangularApp')
  .factory 'Interceptor', ($q, AlertaService, $location) ->
    # Public API here
    {
      request: (config)->
        config or $q.when config

      requestError: (rejection)->
        $q.reject rejection

      response: (response)->
        response or $q.when response

      responseError: (rejection)->
        switch rejection.status
          when 403,404
            AlertaService.error(rejection.data.token, rejection.status)
          when 401
            $rootScope.userData = {autenticado: false, login: null}
            $location.path '/login'
            AlertaService.error(rejection.data.token, status)

        $q.reject rejection
    }


