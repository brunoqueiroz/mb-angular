'use strict'

angular.module('mbangularApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ui.router',
  'pascalprecht.translate',
  'ngGrid'
])
  .config ($httpProvider, $translateProvider) ->
    $httpProvider.interceptors.push 'Interceptor'
    
    $translateProvider.useStaticFilesLoader
      prefix: 'l10n/'
      suffix: '.json'
    $translateProvider.preferredLanguage 'pt_BR'

  .config ($stateProvider, $urlRouterProvider, $httpProvider, ALLOWED, RESTRICTED) ->

    $urlRouterProvider
      .when('/usuario', '/usuario/listar')
      .when('/usuario/', '/usuario/listar')
      .otherwise "/login"

    $stateProvider
      .state 'login', 
        url: "/login",
        controller: 'LoginCtrl'
        data:
          access: ALLOWED
        templateUrl: "views/login.html"
      .state 'usuario', 
        url: "/usuario"
        controller: 'UsuarioCtrl'
        templateUrl: "views/usuario/usuario.html"
        data:
          access: RESTRICTED
      .state 'usuario.listar', 
        url: "/listar"
        controller: 'ListarUsuarioCtrl'
        templateUrl: "views/usuario/usuario.listar.html"
        resolve:
          usuarios: ['UsuarioService', (UsuarioService) ->
            UsuarioService.listar()
          ]
        data:
          access: RESTRICTED
      .state 'usuario.editar', 
        url: "/editar/:id"
        controller: 'EditarUsuarioCtrl'
        templateUrl: "views/usuario/usuario.editar.html"
        data:
          access: RESTRICTED
        resolve:
          usuario: ['UsuarioService','$stateParams', (UsuarioService, $stateParams) ->
            UsuarioService.recuperarUsuario($stateParams.id)
          ]
  
  .run ($rootScope, Autenticacao, $log) ->
    $rootScope.userData = window.UserData
    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->    
      $log.info "$stateChangeSuccess toState: #{toState.name} fromState: #{fromState.name}"

    $rootScope.$on '$locationChangeStart', (event, nextLocation, currentLocation) ->
      #console.log 'nextLocation', nextLocation, 'currentLocation', currentLocation
      $log.info "$locationChangeStart nextLocation: #{nextLocation}"

    $rootScope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->
      $log.info "$stateChangeStart toState: #{toState.name} fromState: #{fromState.name}"
      Autenticacao.checarAutenticacao(toState, event.preventDefault)

  .constant('ALLOWED', 'ALLOWED')
  .constant('RESTRICTED', 'RESTRICTED')
  .constant('$config', window.Config)

  




    


