'use strict'
angular.module('mbangularApp')
  .factory 'ListarUsuarioTransformResponse', ['$translate', ($translate) ->
    return (response, headers) ->
      try
        return responseParsed = JSON.parse(response)
      catch e
        return {token:'erro.converter.objeto'}
      
      #response = []
      #for usuario in responseParsed
      #  response.push {nome: usuario.nome, login: usuario.login}
      #return response
  ]