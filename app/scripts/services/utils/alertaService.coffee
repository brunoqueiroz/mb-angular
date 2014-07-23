'use strict'

angular.module('mbangularApp')
  .factory 'AlertaService', ($rootScope) ->
    # Public API here
    {
      error: (msg, status = 'none') ->
        $rootScope.$broadcast 'httpErrorEvent', msg, status
    }


